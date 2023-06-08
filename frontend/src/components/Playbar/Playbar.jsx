import { useSelector } from "react-redux";
import AudioPlayer, { RHAP_UI } from 'react-h5-audio-player';
import 'react-h5-audio-player/lib/styles.css';
import './Playbar.css';

function PlayBar() {
  const currentSong = useSelector(state => state.audio.currentSong);
  const songUrl = currentSong?.mp3;

  if (!currentSong) {
    // Return alternative UI or default state for playbar
    return null;
  }

  return (
    <div className='footer-container'>
      <div className="play-bar-track-info">
        <div className="now-playing-section">
          <div className="now-playing-artist-info">
            <p className="now-playing-artist-info-name">{currentSong.name}</p>
            <p className="now-playing-artist-info-artist">{currentSong.artistName}</p>
          </div>
        </div>
      </div>
      <div className="play-bar-control-container">
          <AudioPlayer 
            src={songUrl} 
            layout="stacked-reverse"
            autoPlay={true}
            showFilledVolume={true}
            style={{
              width: '100%',
              height: '100%'
            }}
            customControlsSection={[RHAP_UI.MAIN_CONTROLS]}
            customProgressBarSection={[
              RHAP_UI.CURRENT_TIME,
              RHAP_UI.PROGRESS_BAR,
              RHAP_UI.DURATION,
              RHAP_UI.VOLUME,
            ]}
          />
      </div>
    </div>
  );
}

export default PlayBar;
