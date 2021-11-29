var script = document. createElement('script');
script. src = '//code.jquery.com/jquery-1.11.0.min.js';
document. getElementsByTagName('head')[0]. appendChild(script);
function check()
{
   if($('#flexCheckDefault').attr(':checked'))
   {
      $('#flexCheckChecked').attr('checked', false)
   }
}
function check2()
{
   if($('#flexCheckChecked').attr(':checked'))
   {
      $('#flexCheckDefault').attr('checked', false)
   }
}