document.addEventListener('DOMContentLoaded', function() {
    const toggleButton = document.getElementById('esconder'); // Botón para alternar la visibilidad
    const menuContainer = document.querySelector('.con_menu'); // Contenedor del menú

    // Filtra los elementos para alternar su visibilidad, excluyendo los contenedores con imágenes e íconos
    const elementsToToggle = Array.from(menuContainer.children).filter(child =>
        !child.querySelector('.icono_menu') && 
        !child.querySelector('.con_imagen') && 
        !child.querySelector('.icono') && 
        !child.classList.contains('con_opcion')); // Excluir elementos con la clase 'con_opcion'

    // Selecciona todos los elementos <h4> dentro del contenedor del menú
    const h4Elements = menuContainer.querySelectorAll('h4');

    // Agrega todos los <h4> al array de elementos a alternar
    h4Elements.forEach(h4 => elementsToToggle.push(h4));

    // También oculta el contenedor de la opción del menú
    const optionContainers = document.querySelectorAll('.con_opcion');
    optionContainers.forEach(container => elementsToToggle.push(container));

    toggleButton.addEventListener('click', () => {
        elementsToToggle.forEach(element => {
            if (element.style.display === 'none') {
                element.style.display = ''; // Si está oculto, hacerlo visible
            } else {
                element.style.display = 'none'; // Si está visible, ocultarlo
            }
        });
    });
});