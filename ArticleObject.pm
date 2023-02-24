package ArticleObject;
use warnings;


sub new {

    my ($class, %args) = @_;

    # assign the hash of supplied values to the object itself.
    # If a key in %args is 'key', then they are available from $self via $self->{'key'}
    my $self = \%args;

    bless ($self, $class);

    $self->{'_quickAttributes'} = ['title','author','date','authorType','intro','body','video'];

    return $self;

}

sub get {

	my ($self, $key) = @_;

    # only get or set values in $self->{'_quickAttributes'} directly.
    for (@{ $self->{'_quickAttributes'}} ){
	    if ($_  eq $key){
	        return $self->{$key};
	    }
	}
	print ("ERROR, Key $key not supported\n");

}

sub set {

	my ($self, $key, $value) = @_;

    # only get or set values in $self->{'_quickAttributes'} directly.
    for (@{ $self->{'_quickAttributes'}}){

	    if ($_  eq $key){
	        $self->{$key} = $value;

	        # removing the next return will cause an erroneous error message to appear...
	        return ;
	    }
    }
	print ("ERROR, Key $key not supported\n");

}

sub getPhoto {

	my ($self, $index) = @_;
	if (exists $self->{'photo' . $index}){
		return $self->{'photo' . $index};
	} else {
		return ;
	}
}

sub setPhoto {

	my ($self, $index, $value) = @_;
	$self->{'photo' . $index} = $value;

}

sub getCaption {

	my ($self, $index) = @_;
	if (exists $self->{'caption' . $index}){
		return $self->{'caption' . $index};
	} else {
		return ;
	}

}

sub setCaption {

	my ($self, $index, $value) = @_;
	$self->{'caption' . $index} = $value;

}

sub _test {

	my ($self) = @_;

	$self->set('title', 'one');

	if ($self->get('title') eq 'one'){
		print "basic set/get test passed \n ";
	}

	print "Next line SHOULD SHOW ERROR About 'Key unknownKey not supported\n";
	$self->set('unknownKey','unknownValue');


	for (my $x=0; $x < 10; $x++){

    	$self->setPhoto($x, "+" . $x . "+");
    	if ($self->getPhoto($x) eq "+" . $x ."+"){
    		print "Set photo $x passed \n";
    	} else {
    		print "Set caption $x failed \n";
    	}

    	$self->setCaption($x, "-" . $x . "-");
    	if ($self->getCaption($x) eq "-" . $x . "-"){
    		print "Set caption $x passed \n";
    	} else {
    		print "Set caption $x failed \n";
    	}

	}

}

1;
