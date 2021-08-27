import React from "react";
import {Modal, Table} from "reactstrap";
import AddWhiskeyModal from "./WhiskeyModalAdd";
// import Distillery from "../../models/distillery.rb"

class WhiskeyTable extends React.Component {

    columns = [
        {
            title: 'id',
            dataIndex: 'id',
            key: 'id'
        },
        {
            title: 'Brand',
            dataIndex: 'brand',
            key: 'brand'
        },
        {
            title: 'Name',
            dataIndex: 'name',
            key: 'name'
        },
        {
            title: 'Style',
            dataIndex: 'style',
            key: 'style'
        },
        {
            title: 'Distiller',
            dataIndex: 'distiller',
            key: 'distiller'
        },
        {
            title: 'Rating',
            dataIndex: 'rating',
            key: 'rating'
        },
        {
            title: 'ABV',
            dataIndex: 'abv',
            key: 'abv'
        },
        {
            title: 'Edit/Delete',
            key: 'action'
        }
    ];

    state = {
        whiskeys: []
    };

    componentDidMount() {
        this.loadWhiskeys();
    }

    loadWhiskeys = () => {
        const url = 'api/v1/whiskeys/index';
        fetch(url)
            .then((data) => {
                if (data.ok) {
                    return data.json();
                }
                throw new Error('Network error.');
            })
            .then((data) => {
                data.forEach((whiskey) => {
                    const newEl = {
                        key: whiskey.id,
                        id: whiskey.id,
                        brand: whiskey.brand,
                        name: whiskey.name,
                        style: whiskey.style,
                        distiller: whiskey.distillery_id,
                        // distiller: Distillery.where(id: whiskey.distillery_id).name,
                        rating: whiskey.rating,
                        abv: whiskey.abv
                    };

                    this.setState((prevState) => ({
                        whiskeys: [...prevState.whiskeys, newEl]
                    }));
                });
            })
            .catch((err) => message.error("Error: " + err));
    };

    reloadWhiskeys = () => {
        this.setState({ whiskeys: [] });
        this.loadWhiskeys();
    };

    deleteWhiskey = (id) => {
        const url = `api/v1/whiskeys/${id}`
        fetch(url, {
            method: "delete",
        })
            .then((data) => {
                if (data.ok) {
                    this.reloadWhiskeys();
                    return data.json();
                }
                throw new Error("Network error.");
            })
            .catch((err) => message.error("Error: " + err));
    };

    render() {
        return (
            <>
                <Table hover>
                    <thead>
                    <tr>
                        {this.columns.map(
                            ({
                                 title, key
                             }) => (
                                <th key={key}>{title}</th>
                            )
                        )}
                    </tr>
                    </thead>
                    <tbody>
                    {this.state.whiskeys.map(
                        ({
                             id,
                             brand,
                             name,
                             style,
                             distiller,
                             rating,
                             abv
                         }) => (
                            <tr key={id}>
                                <td>{id}</td>
                                <td>{brand}</td>
                                <td>{name}</td>
                                <td>{style}</td>
                                <td>{distiller}</td>
                                <td>{rating}</td>
                                <td>{abv}</td>
                                <ConfirmDelete id={id} />
                                {/*<td>*/}
                                {/*    <a href={''}>Edit</a>/*/}
                                {/*    <button onClick={this.deleteWhiskey(id)}>Delete</button>*/}
                                {/*</td>*/}
                            </tr>
                        )
                    )}
                    </tbody>
                </Table>
                <AddWhiskeyModal reloadWhiskeys={this.reloadWhiskeys} />
            </>
        )
    }
};

export default WhiskeyTable;

class ConfirmDelete extends React.Component {
    constructor(props) {
        super(props);
        this.id = props.id;
    }
    render() {
        return (
            <>
            <td>
                <a href={''}>Edit</a>/
                <button>Delete</button>
            </td>
            </>
        )
    }
}
