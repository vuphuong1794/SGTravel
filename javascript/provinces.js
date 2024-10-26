class ProvincesManager {
    constructor() {
        // API URL
        this.API_URL = 'https://provinces.open-api.vn/api/?depth=2';
        // Cache key
        this.CACHE_KEY = 'VN_PROVINCES_DATA';
        this.CACHE_DURATION = 24 * 60 * 60 * 1000; // 24 hours
        
        // DOM elements
        this.provinceSelect = document.getElementById('provinceSelect');
        this.districtSelect = document.getElementById('districtSelect');
        this.provinceSearch = document.getElementById('provinceSearch');
        this.districtSearch = document.getElementById('districtSearch');
        
        // Bind methods
        this.init = this.init.bind(this);
        this.handleProvinceChange = this.handleProvinceChange.bind(this);
        this.handleProvinceSearch = this.handleProvinceSearch.bind(this);
        this.handleDistrictSearch = this.handleDistrictSearch.bind(this);
        
        // Data storage
        this.provincesData = null;
    }

    // Khởi tạo
    async init() {
        try {
            // Thêm event listeners
            this.addEventListeners();
            
            // Load data
            await this.loadProvinceData();
            
            // Populate initial province select
            this.populateProvinceSelect();
            
        } catch (error) {
            console.error('Initialization error:', error);
            this.showError('Không thể khởi tạo dữ liệu. Vui lòng thử lại sau.');
        }
    }

    // Thêm event listeners
    addEventListeners() {
        this.provinceSelect.addEventListener('change', this.handleProvinceChange);
        if (this.provinceSearch) {
            this.provinceSearch.addEventListener('input', this.handleProvinceSearch);
        }
        if (this.districtSearch) {
            this.districtSearch.addEventListener('input', this.handleDistrictSearch);
        }
    }

    // Load data từ cache hoặc API
    async loadProvinceData() {
        // Check cache first
        const cachedData = this.getFromCache();
        if (cachedData) {
            this.provincesData = cachedData;
            return;
        }

        // If no cache, fetch from API
        try {
            this.setLoading(true);
            const response = await fetch(this.API_URL);
            if (!response.ok) throw new Error('Network response was not ok');
            
            this.provincesData = await response.json();
            this.saveToCache(this.provincesData);
            
        } catch (error) {
            throw new Error('Không thể tải dữ liệu từ server');
        } finally {
            this.setLoading(false);
        }
    }

    // Cache management
    saveToCache(data) {
        const cacheData = {
            data: data,
            timestamp: new Date().getTime()
        };
        localStorage.setItem(this.CACHE_KEY, JSON.stringify(cacheData));
    }

    getFromCache() {
        try {
            const cache = localStorage.getItem(this.CACHE_KEY);
            if (!cache) return null;

            const { data, timestamp } = JSON.parse(cache);
            const now = new Date().getTime();
            
            // Check if cache is expired
            if (now - timestamp > this.CACHE_DURATION) {
                localStorage.removeItem(this.CACHE_KEY);
                return null;
            }

            return data;
        } catch {
            return null;
        }
    }

    // UI Updates
    setLoading(isLoading) {
        this.provinceSelect.disabled = isLoading;
        this.districtSelect.disabled = true;
        
        if (isLoading) {
            this.provinceSelect.innerHTML = '<option value="">Đang tải...</option>';
            this.districtSelect.innerHTML = '<option value="">Đang tải...</option>';
        }
    }

    showError(message) {
        // Add error message to the page
        const errorDiv = document.createElement('div');
        errorDiv.className = 'error-message';
        errorDiv.textContent = message;
        this.provinceSelect.parentNode.insertBefore(errorDiv, this.provinceSelect);
        
        // Remove after 5 seconds
        setTimeout(() => errorDiv.remove(), 5000);
    }

    // Populate selects
    populateProvinceSelect(filterText = '') {
        this.provinceSelect.innerHTML = '<option value="">Chọn Tỉnh/Thành phố</option>';
        
        const filteredProvinces = this.provincesData.filter(province => 
            province.name.toLowerCase().includes(filterText.toLowerCase())
        );

        filteredProvinces.forEach(province => {
            const option = document.createElement('option');
            option.value = province.code;
            option.textContent = province.name;
            this.provinceSelect.appendChild(option);
        });
    }

    populateDistrictSelect(provinceCode, filterText = '') {
        this.districtSelect.innerHTML = '<option value="">Chọn Quận/Huyện</option>';
        
        const province = this.provincesData.find(p => p.code === Number(provinceCode));
        if (!province) return;

        const filteredDistricts = province.districts.filter(district =>
            district.name.toLowerCase().includes(filterText.toLowerCase())
        );

        filteredDistricts.forEach(district => {
            const option = document.createElement('option');
            option.value = district.code;
            option.textContent = district.name;
            this.districtSelect.appendChild(option);
        });

        this.districtSelect.disabled = false;
    }

    // Event Handlers
    handleProvinceChange(event) {
        const provinceCode = event.target.value;
        this.districtSelect.disabled = !provinceCode;
        
        if (provinceCode) {
            this.populateDistrictSelect(provinceCode);
            if (this.districtSearch) {
                this.districtSearch.disabled = false;
            }
        } else {
            this.districtSelect.innerHTML = '<option value="">Chọn Quận/Huyện</option>';
            if (this.districtSearch) {
                this.districtSearch.disabled = true;
                this.districtSearch.value = '';
            }
        }
    }

    handleProvinceSearch(event) {
        this.populateProvinceSelect(event.target.value);
    }

    handleDistrictSearch(event) {
        const provinceCode = this.provinceSelect.value;
        if (provinceCode) {
            this.populateDistrictSelect(provinceCode, event.target.value);
        }
    }
}

// Initialize when DOM is ready
document.addEventListener('DOMContentLoaded', () => {
    const manager = new ProvincesManager();
    manager.init();
});