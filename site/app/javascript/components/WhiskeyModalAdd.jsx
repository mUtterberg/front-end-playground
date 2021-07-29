import React from "react";
import {Button, Form, FormFeedback, FormGroup, Input, Label, Modal, ModalBody, ModalFooter, ModalHeader} from "reactstrap";

class AddWhiskeyModal extends React.Component {
    formRef = React.createRef();
    state = {
        visible: false
    };

    onFinish = (event) => {
        event.preventDefault();
        const url = 'api/v1/whiskeys/';
        let newWhiskey = {
            brand: event.target.brand.value,
            name: event.target.name.value,
            style: event.target.style.value,
            distiller: event.target.distiller.value,
            abv: event.target.abv.value,
            rating: event.target.rating.value
        }

        // fetch post request
        fetch(url, {
            method: 'post',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(newWhiskey)
        })
            .then((data) => {
                console.log(data);
            if (data.ok) {
                this.setState({
                    visible: false
                })
                
                return data.json();
            }
            throw new Error('Network error.');
        })
            .then(() => {
                this.props.reloadWhiskeys();
            })
            .catch((err) => console.error('Error: ' + err));
    };

    showModal = () => {
        this.setState({
            visible: true
        });
    };

    handleCancel = () => {
        this.setState({
            visible: false
        });
        console.log('Modal closed without saving.')
    };

    render() {
        return (
            <>
                <Button color='primary' onClick={this.showModal}>
                    Create New +
                </Button>
                <Modal isOpen={this.state.visible}>
                    <ModalHeader>
                        Add a new Whiskey to the table
                    </ModalHeader>
                    <ModalBody>
                        <Form innerRef={this.formRef} onSubmit={this.onFinish}>
                            <FormGroup>
                                <Label for={'brand'}>Brand</Label>
                                <Input type={'brand'} name={'brand'} id={'brand'} placeholder={'Brand (e.g. Elijah Craig)'} />
                            </FormGroup>
                            <FormGroup>
                                <Label for={'name'}>Name</Label>
                                <Input type={'name'} name={'name'} id={'name'} placeholder={'Name (optional, e.g. Barrel Proof)'}/>
                            </FormGroup>
                            <FormGroup>
                                <Label for={'style'}>Style</Label>
                                <Input type={'style'} name={'style'} id={'style'} placeholder={'Style (e.g. Scotch, Bourbon)'}/>
                            </FormGroup>
                            <FormGroup>
                                <Label for={'distiller'}>Distiller</Label>
                                <Input type={'distiller'} name={'distiller'} id={'distiller'} placeholder={'Distiller (e.g. Heaven Hill)'}/>
                            </FormGroup>
                            <FormGroup>
                                <Label for={'rating'}>Rating</Label>
                                <Input type={'rating'} name={'rating'} id={'rating'} placeholder={'Rating (e.g. 87)'}/>
                            </FormGroup>
                            <FormGroup>
                                <Label for={'abv'}>ABV</Label>
                                <Input type={'abv'} name={'abv'} id={'abv'} placeholder={'ABV (e.g. 0.43)'}/>
                            </FormGroup>
                            <Button color={'primary'} type={'submit'}>Save</Button>
                            <Button color={'secondary'} type={'button'} onClick={this.handleCancel}>Cancel</Button>
                        </Form>
                    </ModalBody>
                </Modal>
            </>
        )
    }
};

export default AddWhiskeyModal;
