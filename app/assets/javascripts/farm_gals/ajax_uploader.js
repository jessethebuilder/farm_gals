function initializeAjaxUploaderInputs(selector){
  $(selector).each(function(i, elem){
    var file_input = $(elem);
    var form = $(file_input).parents('form:first');
    var submit_button = form.find('input[type="submit"]');
    var progress_bar = $('<div class="progress_bar"></div>');
    var progress_bar_box = $('<div class="progress_box"></div>').append(progress_bar);
    file_input.after(progress_bar_box);

    file_input.fileupload({
      fileInput: file_input,
      url: form.data('url'),
      type: 'POST',
      autoUpload: true,
      formData: form.data('form-data'),
      paramName: 'file',
      dataType: 'XML',
      replaceFileInput: false,
      progressall: function(e, data){
        var progress = parseInt(data.loaded / data.total * 100, 10);
        progress_bar.css('width', progress + '%');
      },
      start: function(e){
        submit_button.prop('disabled', true);

        progress_bar.
          css('background', 'green').
          css('display', 'block').
          css('width', '0%').
          text('Loading...')
      },
      done: function(e, data){
        submit_button.prop('disabled', false);
        progress_bar.text('Upload Complete');

        var key = $(data.jqXHR.responseXML).find('Key').text();
        var url = '//' + form.data('host') + '/' + key;

        var input = $("<input />", {type: 'hidden',
                                    name: file_input.attr('name'),
                                    value: url});
        form.append(input);

        file_input.val('');
      },
      fail: function(e, data){
        submit_button.prop('disabled', false);

        progress_bar.css("background", "red").text("Upload Failed");
      }
    });
  });
}
