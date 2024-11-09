fetch("https://vn-public-apis.fpo.vn/provinces/getAll?limit=-1")
  .then((res) => res.json())
  .then((data) => {
    console.log(data); // Kiểm tra cấu trúc dữ liệu trả về
    const provinces = data.data.data; // Access the provinces array

    // Kiểm tra xem provinces có phải là một mảng không
    if (Array.isArray(provinces)) {
      const provinceSelect = document.getElementById("provinceSelect");

      provinces.forEach((province) => {
        provinceSelect.innerHTML += `<option value="${province.code}">${province.name}</option>`; // Sử dụng tên tỉnh làm giá trị
      });

      const savedProvince = localStorage.getItem('selectedProvince');
      if (savedProvince) {
        provinceSelect.value = savedProvince;
        fetchDistricts(savedProvince); 
      }
    } else {
      console.error("Provinces data is not an array:", provinces);
    }
  })
  .catch((err) => console.error("Error fetching provinces:", err));

function fetchDistricts(provinceCode) {
  fetch(`https://vn-public-apis.fpo.vn/districts/getByProvince?provinceCode=${provinceCode}&limit=-1`)
    .then((res) => res.json())
    .then((data) => {
      let districts = data.data.data;
     
      document.getElementById("districtSelect").innerHTML = `<option value="">Chọn Quận/Huyện</option>`;
      if (districts !== undefined) {
        districts.forEach((district) => {
          document.getElementById("districtSelect").innerHTML += `<option value="${district.name}">${district.name}</option>`; // Sử dụng tên quận làm giá trị
        });
      }
    })
    .catch((err) => console.log(err));
}

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

function getProvinces(event) {
  const selectedProvinceName = event.target.value; 
  localStorage.setItem('selectedProvince', event.target.value); // Lưu tỉnh đã chọn vào local storage
  fetchDistricts(event.target.value); // event.target.value là mã tỉnh
  //fetchProvinceCode(selectedProvinceName); 
}

document.getElementById("provinceSelect").addEventListener("change", getProvinces);

const savedDistrict = localStorage.getItem('selectedDistrict');
if (savedDistrict) {
  document.getElementById("districtSelect").value = savedDistrict; 
}
