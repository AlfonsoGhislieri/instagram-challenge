console.log("hello")

let deleteFlashMessages = () => {
  let existingFlash = document.getElementById("flashmessage");
  if (existingFlash) {
    existingFlash.remove();
  }
}


