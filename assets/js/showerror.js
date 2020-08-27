'use strict';

const getUserFriendlyError = require('./userfriendlyerror');

export const showError = ($modal, error) => {
  // Add the appropriate error message to the alert.
  $('div.alert', $modal).html(getUserFriendlyError(error));
  $modal.modal({
    backdrop: 'static',
    focus: true,
    keyboard: false,
    show: true
  });

  $('#show-error-label', $modal).text(`${error.name}${error.message
    ? `: ${error.message}`
    : ''}`);
}
