<script setup>
import userIcon from "@/assets/icons/account.svg";
import flagIcon from "@/assets/icons/flag.svg";
</script>

<template>
  <div v-if="!lockedGuess" id="round2">
    <h2>Where did the following event happen:</h2>
    <h2>
      <span class="highlight">{{ eventClue }} </span> ?
    </h2>
    <div style="width: 50vw; height: 30vh">
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
    <p>You selected {{ localCoord }}</p>
  </div>
  <div v-else id="round2-guessed">
    <h2>
      You gained <span class="highlight">{{ correct.points }} </span> points !
    </h2>
    <div style="width: 50vw; height: 30vh">
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
          <l-icon :icon-url="flagIcon" :icon-size="[50, 50]" />
        </l-marker>
        <l-marker :lat-lng="localCoord">
          <l-icon :icon-url="userIcon" :icon-size="[21, 21]" />
        </l-marker>
        <l-polyline
          :lat-lngs="[[correct.correctLat, correct.correctLng], localCoord]"
        />
      </l-map>
    </div>
    <p>
      You were <span class="highlight"> {{ correct.distance }}</span> km away
    </p>
    <p>{{ correct }}</p>
  </div>
</template>

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
