const Map = {
    mounted() {
        let map = document.getElementById('map');
        if (map) {
            map.addEventListener('marker-moved', (e) => {
                this.pushEvent(
                    'marker-moved',
                    { coord: e.detail.getLngLat().toArray() }
                );
            }, false);
        }
    }
}

export default Map;