var elem = document.getElementById('add');

if (elem !== null) {
    elem.addEventListener('click',
        function () {
            var addform = document.getElementById('addform');
            if (addform.style.display === 'none') {
                addform.style.display = 'block';
            } else {
                addform.style.display = 'none';
            }
        }
    );
}