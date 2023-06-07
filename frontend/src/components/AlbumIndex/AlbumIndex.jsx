import React, { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { fetchAllAlbums } from '../../store/album';
import AlbumIndexItem from './AlbumIndexItem';
import './AlbumIndex.css';

function AlbumIndex() {
  const dispatch = useDispatch();
  const albums = useSelector((state) => Object.values(state.album));

  useEffect(() => {
    dispatch(fetchAllAlbums());
  }, [dispatch]);

   if (!albums) {
        return null;
    }
    
  return (
    <div className="album-index-flex-container">
      <div className="album-index-container">
        <h2 className="album-index-title">Albums</h2>
        <div className="album-item-index-flexbox">
          {albums.map((album) => (
            <AlbumIndexItem key={album.id} album={album} />
          ))}
        </div>
      </div>
    </div>
  );
}

export default AlbumIndex;
