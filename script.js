const toggleButtons = document.querySelectorAll("toggle-button");
const list = document.querySelectorAll("list");

toggleButtons.forEach((button) => {
  button.addEventListener("click", () => {
    if (list.style.display === "none") {
      list.style.display = "block";
    } else {
      list.style.display = "none";
    }
  });
});
