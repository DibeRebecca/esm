
class SignUpWithEmailAndPasswordFailure{
  final String message;

  const SignUpWithEmailAndPasswordFailure([this.message="Une erreur inconnue est survenue"]);

factory SignUpWithEmailAndPasswordFailure.code(String code){
  switch (code) {
    case'weak-password':
    return const SignUpWithEmailAndPasswordFailure('Please enter a stonger password');

    case'invalid-email':
    return const SignUpWithEmailAndPasswordFailure('Email invalide, ou mal ecrit');
    
    case'email-already-in-use':
    return const SignUpWithEmailAndPasswordFailure('Le mail est deja utiisé');
    case'operation-not-allowed':
    return const SignUpWithEmailAndPasswordFailure('Operation non permise');
    case'user-disabled':
    return const SignUpWithEmailAndPasswordFailure('Cet utilisateur est bloqué');
    default:
    return const SignUpWithEmailAndPasswordFailure();
  }
}
}