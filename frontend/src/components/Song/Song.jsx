import './Song.css';
import { useDispatch } from 'react-redux';
import { setCurrentSong } from '../../store/audio'; // Import the action creator for setting the current song

function Song({ song, albumId }) {
  const artistName = song.artistName;
  const dispatch = useDispatch();

  const handlePlaySong = () => {
    dispatch(setCurrentSong(song));
  };

  return (
    <div className="song-album-item-container">
      <div className="song-album-item">
        <div className="song-album-item-#">
          <div className="song-album-item-id">{albumId}</div>
        </div>
        <div className="song-album-item-info">
          <button className="song-album-item-link" onClick={handlePlaySong}>
          <p className="song-album-item-name">{song.name}</p>
          <p className="song-album-item-runtime">{song.runtime}</p>
          <p className="song-album-item-artist">{artistName}</p>
          </button>
        </div>
      </div>
    </div>
  );
};

export default Song;
