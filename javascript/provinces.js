//luon chay khi load trang
fetch("https://vn-public-apis.fpo.vn/provinces/getAll?limit=-1")
  .then((res) => res.json())
  .then((data) => {
    let provinces = data.data.data;
    provinces.map(
      (value) =>
        (document.getElementById(
          "provinceSelect"
        ).innerHTML += `<option value="${value.code}">${value.name}</option>`)
    );
  })
  .catch((err) => console.log(err));

function fetchDistricts(provinceID) {
  fetch(`https://vn-public-apis.fpo.vn/districts/getByProvince?provinceCode=${provinceID}&limit=-1`)
    .then((res) => res.json())
    .then((data) => {
     let districts = data.data.data;
     //reset lai cac quan huyen truoc do
     document.getElementById("districtSelect").innerHTML = `<option value="">Chọn Quận/Huyện</option>`;
     if(districts !== undefined){
        districts.map(
            (value) =>
              (document.getElementById(
                "districtSelect"
              ).innerHTML += `<option value="${value.code}">${value.name}</option>`)
          );
     }
    })
    .catch((err) => console.log(err));
}

function getProvinces(event) {
  fetchDistricts(event.target.value);
}
