// Fetch provinces when the page loads
fetch("https://vn-public-apis.fpo.vn/provinces/getAll?limit=-1")
  .then((res) => res.json())
  .then((data) => {
    console.log(data); // Kiểm tra cấu trúc dữ liệu trả về
    const provinces = data.data.data; // Access the provinces array

    // Kiểm tra xem provinces có phải là một mảng không
    if (Array.isArray(provinces)) {
      const provinceSelect = document.getElementById("provinceSelect");

      // Populate province dropdown
      provinces.forEach((province) => {
        provinceSelect.innerHTML += `<option value="${province.code}">${province.name}</option>`; // Sử dụng tên tỉnh làm giá trị
      });

      // Load saved province from local storage
      const savedProvince = localStorage.getItem('selectedProvince');
      if (savedProvince) {
        provinceSelect.value = savedProvince;
        fetchDistricts(savedProvince); // Fetch districts for the saved province
      }
    } else {
      console.error("Provinces data is not an array:", provinces);
    }
  })
  .catch((err) => console.error("Error fetching provinces:", err));

// Fetch districts based on selected province
function fetchDistricts(provinceCode) {
  fetch(`https://vn-public-apis.fpo.vn/districts/getByProvince?provinceCode=${provinceCode}&limit=-1`)
    .then((res) => res.json())
    .then((data) => {
      let districts = data.data.data;
      // Reset districts dropdown
      document.getElementById("districtSelect").innerHTML = `<option value="">Chọn Quận/Huyện</option>`;
      if (districts !== undefined) {
        districts.forEach((district) => {
          document.getElementById("districtSelect").innerHTML += `<option value="${district.name}">${district.name}</option>`; // Sử dụng tên quận làm giá trị
        });
      }
    })
    .catch((err) => console.log(err));
}

// Fetch province code based on province name
function fetchProvinceCode(provinceName) {
  fetch("https://vn-public-apis.fpo.vn/provinces/getAll?limit=-1")
    .then((res) => res.json())
    .then((data) => {
      const provinces = data.data.data;
      const province = provinces.find(p => p.name === provinceName);
      if (province) {
        console.log(`Province code for ${provinceName}: ${province.code}`);
        return province.code;
      } else {
        console.error("Province not found:", provinceName);
      }
    })
    .catch((err) => console.error("Error fetching province code:", err));
}

// Event listener for province selection
function getProvinces(event) {
  const selectedProvinceName = event.target.value; 
  localStorage.setItem('selectedProvince', event.target.value); // Lưu tỉnh đã chọn vào local storage
  fetchDistricts(event.target.value); // event.target.value là mã tỉnh
  fetchProvinceCode(selectedProvinceName); // Call the function to get province code
}

// Attach event listener to province select
document.getElementById("provinceSelect").addEventListener("change", getProvinces);

// Load districts when the page loads if a province is saved
const savedDistrict = localStorage.getItem('selectedDistrict');
if (savedDistrict) {
  document.getElementById("districtSelect").value = savedDistrict; // Set saved district
}
