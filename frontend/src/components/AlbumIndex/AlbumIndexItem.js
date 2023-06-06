import { NavLink } from 'react-router-dom';

function AlbumIndexItem({album}) {
    const artistName = album.artist.name;

    return (
        <NavLink to={`albums/${album.id}`} className='album-index-item-link'>
            <div className='album-index-item'>
                <h3 className="album-name">{album.name}</h3>
                <span className="album-index-artist-name">{artistName}</span>
            </div>
        </NavLink>
    )
}

export default AlbumIndexItem;