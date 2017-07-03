@extends('plantilla')

@section('contenido') 

<div class="">
	  @if (Session::get('mensaje1') )
      <div class="alert alert-info alert-dismissable">
          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            <h4><i class="icon fa fa-info"></i> Mensaje!</h4>
            {{Session::get('mensaje1')}}
      </div>
    @endif
  <center>
		<h2>Bienvenido al Sistema </h2>
	</center>
	<br>
  <p class="lead" align="justify">Hola primero
  <p>
</div>

@stop