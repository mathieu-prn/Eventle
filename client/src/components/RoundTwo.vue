<script setup>
import userIcon from "@/assets/icons/user.svg";
import flagIcon from "@/assets/icons/flag.svg";
</script>

<template>
  <div v-if="!lockedGuess" id="round2">
    <h2>Where did the following event happen:</h2>
    <h2>
      <span class="highlight">{{ eventClue }} </span> ?
    </h2>
    <div class="map-wrap">
      <l-map
        ref="map"
        v-model:zoom="zoom"
        :center="[41, 12]"
        @click="selectCoord"
      >
        <l-tile-layer
          url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
          layer-type="base"
          name="OpenStreetMap"
          attribution="&copy; <a href='https://www.openstreetmap.org/copyright'>OpenStreetMap</a>"
        ></l-tile-layer>
        <l-marker v-if="showMarker" :lat-lng="localCoord"></l-marker>
      </l-map>
    </div>
  </div>
  <div v-else id="round2-guessed">
    <h2>
      You gained <span class="highlight">{{ correct.points }} </span> points !
    </h2>
    <div class="map-wrap">
      <l-map
        ref="map"
        v-model:zoom="zoom"
        :center="[correct.correctLat, correct.correctLng]"
      >
        <l-tile-layer
          url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
          layer-type="base"
          name="OpenStreetMap"
          attribution="&copy; <a href='https://www.openstreetmap.org/copyright'>OpenStreetMap</a>"
        ></l-tile-layer>
        <l-marker :lat-lng="[correct.correctLat, correct.correctLng]">
          <l-icon
            :icon-url="flagIcon"
            :icon-size="[50, 50]"
            :iconAnchor="[10, 41]"
          />
        </l-marker>
        <l-marker :lat-lng="localCoord">
          <l-icon :icon-url="userIcon" :icon-size="[40, 40]" />
        </l-marker>
        <l-polyline
          :lat-lngs="[[correct.correctLat, correct.correctLng], localCoord]"
          color="black"
        />
      </l-map>
    </div>
    <p>
      You were <span class="highlight"> {{ correct.distance }}</span> km away
    </p>
  </div>
</template>

<style scoped>
#round2,
#round2-guessed {
  width: 100%;
  max-width: 680px;
  margin: 0 auto;
}

#round2 h2,
#round2-guessed h2 {
  margin: 8px 0;
  font-size: clamp(18px, 2.5vw, 24px);
}

.map-wrap {
  width: min(100%, 620px);
  height: clamp(280px, 38vh, 420px);
  margin: 18px auto 10px;
  border: 3px solid #fff2db;
  border-radius: 18px;
  overflow: hidden;
  box-sizing: border-box;
}

#round2 p,
#round2-guessed p {
  line-height: 1.4;
  margin: 10px 0 0;
}

@media (max-width: 600px) {
  .map-wrap {
    height: clamp(250px, 42vh, 340px);
  }
}
</style>

<script>
import "leaflet/dist/leaflet.css";
import {
  LMap,
  LTileLayer,
  LMarker,
  LIcon,
  LPolyline,
} from "@vue-leaflet/vue-leaflet";

export default {
  components: {
    LMap,
    LTileLayer,
    LMarker,
    LIcon,
    LPolyline,
  },
  data() {
    return {
      zoom: 3,
      showMarker: false,
    };
  },
  props: {
    eventClue: {
      type: String,
      required: true,
    },
    lockedGuess: {
      type: Boolean,
      required: true,
    },
    coordGuess: {
      type: Array,
      required: true,
    },
    correct: {
      type: Object,
      required: true,
    },
  },
  emits: ["update:coordGuess"],
  computed: {
    localCoord: {
      get() {
        return this.coordGuess;
      },
      set(value) {
        this.$emit("update:coordGuess", value);
      },
    },
  },
  methods: {
    async selectCoord(event) {
      this.showMarker = true;
      this.localCoord = [event.latlng.lat, event.latlng.lng];
    },
  },
};
</script>
