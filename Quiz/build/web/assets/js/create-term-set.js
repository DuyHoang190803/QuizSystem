let termNumber = 1;

function addTerm(term, definition) {
    const termSetDiv = document.getElementById('term-set');
    term = term || '';
    definition = definition || '';
    const newTermHtml = `
                <div class="term rounded-2 bg-white mb-4 pb-1">
                    <div class="px-3 d-flex justify-content-between align-items-center">
                        <span class="text-primary">${termNumber}</span>
                        <button type="button" class="btn btn-sm btn-danger my-2" onclick="deleteTerm(this)">Delete</button>
                    </div>
                    <div class="input-group mb-4 px-4">
                        <textarea name="term" class="auto-resize-input form-control py-3 me-4" rows="1" placeholder="Term..." oninput="resizeInput()"></textarea>
                        <textarea name="definition" class="auto-resize-input form-control py-3 ms-4" rows="1" placeholder="Definition..." oninput="resizeInput()"></textarea>
                    </div>
                </div>
                `;
    termSetDiv.insertAdjacentHTML('beforeend', newTermHtml);
    const newTerm = termSetDiv.lastElementChild;
    newTerm.querySelector('textarea[name="term"]').value = term;
    newTerm.querySelector('textarea[name="definition"]').value = definition;
    termNumber++;
}

function deleteTerm(element) {
    element.closest('.term').remove();
    termNumber--;
    updateTermNumbers();
}

function updateTermNumbers() {
    const terms = document.querySelectorAll('.term');
    terms.forEach((term, index) => {
        term.querySelector('span').innerText = (index + 1).toString();
    });
}

function importTerms() {
    let betweenTermAndDef = document.querySelector('#betweenTermAndDef').value;
    let exportedSet = document.getElementById('exportedSet').value;

    // Normalize newline characters and split the set into lines
    const lines = exportedSet.replace(/\r\n/g, '\n').split('\n\n');
    lines.forEach(line => {
        if (line.trim() !== "") {
            // Split each line into term and definition
            const termAndDef = line.split(betweenTermAndDef);
            // Create and add term element
            addTerm(termAndDef[0].trim(), termAndDef[1].trim());
        }
    });
    resizeInput();
}
document.querySelector('#importModal .btn-import').addEventListener('click', importTerms);

function resizeInput() {
    const inputs = document.querySelectorAll('.auto-resize-input');
    inputs.forEach(element => {
        element.style.height = 'auto';
        element.style.height = element.scrollHeight + 'px';
    });
}


