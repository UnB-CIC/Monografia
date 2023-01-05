const classDM = "dark-mode";
const toggleButton = document.getElementById("dark-mode-btn");
let dark = false;

if (checkDarkModeActive()) {
    toggleDarkMode(false);
}

toggleButton.addEventListener("click", toggleDarkMode);

function checkDarkModeActive() {
    const prevDark = localStorage.getItem(classDM);
    
    return prevDark === "true" || !prevDark
        && window.matchMedia
        && window.matchMedia('(prefers-color-scheme: dark)').matches;
}

function toggleDarkMode(setLocalStorage = true) {
    document.body.classList.toggle(classDM);
    dark = !dark;
    setLinkSymbol();

    if (setLocalStorage) {
        localStorage.setItem(classDM, dark);
    }
}

function setLinkSymbol() {
    toggleButton.textContent = dark ? "☽" : "☀";
}