function postres() {
    seleccionarCategoria("Dessert");
}

function seleccionarCategoria(category) {
    fetch(`https://www.themealdb.com/api/json/v1/1/filter.php?c=${category}`)
        .then(response => response.json())
        .then(data => displayMenus(data.meals))
        .catch(error => console.log('Error fetching meals: ', error));
}

function displayMenus(meals) {
    const contenedor = document.getElementById('contenedor');
    contenedor.innerHTML = meals.map(meal => `
        <div>
            <h3>${meal.strMeal}</h3>
            <img src="${meal.strMealThumb}" alt="${meal.strMeal}">
        </div>
    `).join('');
}

function saludar() {
    alert('Hola mundo');
}

function mensaje() {
    let salida = `
        <h1>¡Hola mundo!</h1>
        <img src="https://img.rojeroweb2.com/starwars1.png">
        <br/>
        <img src="https://img.rojeroweb2.com/starwars3.png">
    `;
    const contenedor = document.getElementById('contenedor');
    contenedor.innerHTML = salida;
}