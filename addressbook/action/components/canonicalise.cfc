component hint="handles request for contacts"{
  // helper function to canonicalise data
  public function decodescope(required struct scope) output=false{
	var key="";
	for (key in arguments.scope){
		if(isSimpleValue(arguments.scope[key])){
			try{
				arguments.scope[key]=canonicalize(arguments.scope[key],true,true);
				}
			catch (any cfactch){
				cflog( text='#key#', application=true, file="encodingErrors", type="error" );
	            arguments.scope[key] = " ";
				}
			}
		}
		return arguments.scope;
	}