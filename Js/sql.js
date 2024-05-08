
    // --------------------------------------------CREATE MEDIC----------------------------------------------------------

  const guardarButton = document.getElementById("guardar-button");
  
  guardarButton.addEventListener("click", function() {
      console.log("i love everything you do.");
      const idNumber = document.querySelector('input[name="doc_id-number"]').value;
      const name = document.querySelector('input[name="doc_name"]').value;
      const age = document.querySelector('input[name="doc_age"]').value;
      const phoneNumber = document.querySelector('input[name="doc_phone-number"]').value;
      const email = document.querySelector('input[name="doc_email"]').value;
      const sex = document.querySelector('input[name="doc_sex"]').value;
      
      const datos = {
          idNumber: idNumber,
          name: name,
          age: age,
          phoneNumber: phoneNumber,
          email: email,
          sex: sex
      };
      
      const xhr = new XMLHttpRequest();
      xhr.open("POST", "php/new_medic.php", true);
      xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
      xhr.onreadystatechange = function() {
          if (xhr.readyState === 4 && xhr.status === 200) {
              console.log(xhr.responseText);
              console.log(datos);
          }
      };
      xhr.send(JSON.stringify(datos));
  });

    // ------------------------------------------ CREATE PATIENT----------------------------------------------

  const valo = document.getElementById("paciente-nuevo");
  
  valo.addEventListener("click", function() {
      
      console.log("when u call me fucking dumb for the stupid shit i do.");
      const pat_docType = document.querySelector('select[name="pat-id-type"]').value;
      const pat_idNumber = document.querySelector('input[name="pat_id-number"]').value;
      const pat_name = document.querySelector('input[name="pat_name"]').value;
      const pat_age = document.querySelector('input[name="pat_age"]').value;
      const pat_phoneNumber = document.querySelector('input[name="pat_phone-number"]').value;
      const pat_email = document.querySelector('input[name="pat_email"]').value;
      const pat_sex = document.querySelector('input[name="pat_sex"]').value;
      const pat_afiliation = document.querySelector('select[name="pat-afi"]').value;
     
      
      
      const daticos = {
          pat_idNumber: pat_idNumber,
          pat_name: pat_name,
          pat_age: pat_age,
          pat_phoneNumber: pat_phoneNumber,
          pat_email: pat_email,
          pat_sex: pat_sex,
          pat_docType: pat_docType,
          pat_afiliation: pat_afiliation
      };
      
      
      const xhr = new XMLHttpRequest();
      xhr.open("POST", "php/new_patient.php", true);
      xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
      xhr.onreadystatechange = function() {
          if (xhr.readyState === 4 && xhr.status === 200) {
              console.log(xhr.responseText);
              console.log(daticos);
          }
      };
      xhr.send(JSON.stringify(daticos));
  });

  // ----------------------------------------------DELETE---------------------------------

  const deleteButtons = document.querySelectorAll('[id^="delete"]');

  deleteButtons.forEach(button => {
      button.addEventListener('click', function() {
          const userId = this.dataset.userId;
          const userRole = button.getAttribute('data-role');

          console.log("chaooo "+ userId);

          console.log("holaaaa "+ userRole);
          // Send AJAX request to delete_user.php

          const chao = {
            userId : userId,
            userRole: userRole
          }
          const xhr = new XMLHttpRequest();
          xhr.open('POST', 'php/delete.php', true);
          xhr.setRequestHeader('Content-Type', 'application/json');

          xhr.onload = function() {
              if (xhr.status === 200) {
                  // Delete the table row from the DOM
                  console.log(xhr.responseText);
                  const tableRow = document.getElementById('table_row_' + userId);
                  if (tableRow) {
                      tableRow.remove();
                  }
              } else {
                  console.error('Error deleting user:', xhr.statusText);
              }
          };

          xhr.onerror = function() {
              console.error('AJAX request failed');
          };

          xhr.send(JSON.stringify(chao));
      });
  });

  // --------------------------------------- MODAL ------------------------------

  const openModalButton  = document.querySelectorAll('[data-modal-target]')
  const closeModalButton  = document.querySelectorAll('[data-close-button]')
  const overlay = document.getElementById('overlay')

  openModalButton.forEach(button => {
    button.addEventListener('click', () => {
      const modal = document.querySelector(button.dataset.modalTarget)
      openModal(modal)
      console.log("uwuwuwu");
    })
  })

  // overlay.addEventListener('click', () => {
  //   const modals = document.querySelectorAll('.modal.active')
  //   modals.forEach(modal => {
  //     closeModal(modal)
  //   })
  // })

  // ↑↑↑↑↑↑↑↑↑↑
  // when click on overlay (background) it closes the modal

  closeModalButton.forEach(button => {
    button.addEventListener('click', () => {
      const modal = button.closest('.modal')
      closeModal(modal)
    })
  })

  function openModal(modal) {
    modal.classList.add('active')
    overlay.classList.add('active')
  }

  function closeModal(modal) {
    modal.classList.remove('active')
    overlay.classList.remove('active')
  }

// -----------------------UPDATE USERS WHEN CLICK ON BUTTON-------------------------

// Iterate over all buttons with id starting with "sage"

const valorant = document.querySelectorAll('[id^="sage"]');
  // ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

// Attach click event listener to each button
valorant.forEach(button => {
    button.addEventListener("click", function(){
        // Get the modal id associated with this button
        console.log("sage");
        const modalId = this.getAttribute('data-modal-id');
        
        // Find all input fields within the modal
        const modal = document.getElementById(modalId);
        const inputs = modal.querySelectorAll('input');

        // Prepare data object to send via AJAX
        const data = {};
        inputs.forEach(input => {
            data[input.name] = input.value;
        });

        // Send AJAX request to update user data
        const xhr = new XMLHttpRequest();
        xhr.open("POST", "php/update.php", true);
        console.log(data);
        alert('Data Updated');
        xhr.send(JSON.stringify(data));
    });
});