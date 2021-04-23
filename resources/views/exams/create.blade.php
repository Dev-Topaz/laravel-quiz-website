@extends('layouts.app')

@section('content')
<div id="main">
    <div id="content" class="full">
        <div class="post manage_forms">
            <div class="content_header">
                <div class="content_header_title">
                    <div style="float: left">
                        <h2>Exam Manager
                        </h2>
                        <p>Create, edit and manage your exams</p>
                    </div>
                    <div style="clear: both; height: 1px"></div>
                </div>
            </div>


            <div class="content_body">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-md-12">
                            <form method="POST" action="{{ url('/exams') }}" class="create_form">
                                @csrf
                                <div class="form-group row">
                                    <label for="name" class="col-md-3 col-form-label text-md-right">{{ __('Name')
                                        }}</label>
                                    <div class="col-md-7">
                                        <input id="name" type="text"
                                               class="form-control @error('name') is-invalid @enderror" name="name"
                                               value="{{ old('name') }}" required autocomplete="name" autofocus>
                                        @error('name')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="description" class="col-md-3 col-form-label text-md-right">{{
                                        __('Description') }}</label>
                                    <div class="col-md-7">
                                        <textarea id="description"
                                                  class="form-control @error('description') is-invalid @enderror"
                                                  name="description"
                                                  value="{{ old('description') }}" rows="4" cols="50"
                                                  autocomplete="description"></textarea>

                                        @error('description')
                                        <span class="invalid-feedback" role="alert">
                                                        <strong>{{ $message }}</strong>
                                                    </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group row mb-0">
                                    <div class="col-md-6 offset-md-4">
                                        <button type="submit" class="btn btn-primary">
                                            {{ __('Create your exam') }}
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
