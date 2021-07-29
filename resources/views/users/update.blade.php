@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-11">
            <div class="card">
                <div class="card-header">{{ __('Update User') }}</div>

                <div class="card-body">
                    <form method="POST" action="{{ url('/users') }}/{{ $user->id }}">
                        @csrf
                        @method('PUT')

                        <div class="form-group row">
                            <label for="name" class="col-md-4 col-form-label text-md-right">{{ __('Name') }}</label>

                            <div class="col-md-6">
                                <input id="name" type="text" class="form-control @error('name') is-invalid @enderror" name="name" value="{{ $user->name }}" required autocomplete="name" autofocus>

                                @error('name')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="email" class="col-md-4 col-form-label text-md-right">{{ __('E-Mail Address') }}</label>

                            <div class="col-md-6">
                                <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ $user->email }}" required autocomplete="email">

                                @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row" style="align-items: center;">
                            <label for="role" class="col-md-4 col-form-label text-md-right">{{ __('Role') }}</label>

                            <div class="col-md-6">
                                <select name="role">
                                    <option value="1" {{ $user->roles[0]->id == 1 ? 'selected' : '' }}>Admin</option>
                                    <option value="2" {{ $user->roles[0]->id == 2 ? 'selected' : '' }}>Student</option>
                                </select>

                                @error('role')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row" style="align-items: center">
                            <label for="active" class="col-md-4 col-form-label text-md-right">{{ __('Active') }}</label>

                            <div class="col-md-1">
                                <input id="active" type="checkbox" class="form-control @error('active') is-invalid @enderror" name="active" value="active" autocomplete="active" style="height: 18px;" {{ $user->active == '1' ? 'checked' : '' }}>

                                @error('active')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <hr/>
                        <div class="row">
                            <h4 style="padding-left: 30px;">Approved Exams</h4>
                        </div>

                        <table width="100%" cellspacing="0" cellpadding="0" border="0" class="table table-striped">
                            <tbody>
                                @foreach($exam_list as $exam)
                                <tr>
                                    <td>{{ $exam->name }}</td>
                                    <td style="width: 20px;"><input id="exam_{{ $exam->id }}" type="checkbox" class="exam_checkbox form-control @error('exam_{{ $exam->id }}') is-invalid @enderror" name="exam_{{ $exam->id }}" value="{{ $exam->id }}" autocomplete="exam_{{ $exam->id }}" style="height: 18px;width: 18px;" {{ $exam->approved ? 'checked' : '' }}></td>
                                </tr>
                                <!-- <div class="form-group row" style="align-items: center">
                                    <label for="exam_{{ $exam->id }}" class="col-md-6 col-form-label text-md-right">{{ $exam->name }}</label>
        
                                    <div class="col-md-1">
                                        <input id="exam_{{ $exam->id }}" type="checkbox" class="exam_checkbox form-control @error('exam_{{ $exam->id }}') is-invalid @enderror" name="exam_{{ $exam->id }}" value="{{ $exam->id }}" autocomplete="exam_{{ $exam->id }}" style="height: 18px;" {{ $exam->approved ? 'checked' : '' }}>
        
                                        @error('exam_{{ $exam->id }}')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div> -->
                                @endforeach
                            </tbody>
                        </table>

                        <input type="text" id="approved_exams" name="approved_exams" value="{{ $user->approved_exams }}" hidden>

                        <div class="form-group row mb-0">
                            <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-primary">
                                    {{ __('Update User') }}
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $('.exam_checkbox').change(function() {
        result = '';
        for (let index = 0; index < $('.exam_checkbox').length; index++) {
            const element = $('.exam_checkbox').eq(index);
            if (element.is(':checked')) result += element.val() + '@';
        }

        $('#approved_exams').val(result);
    });
</script>
@endsection
