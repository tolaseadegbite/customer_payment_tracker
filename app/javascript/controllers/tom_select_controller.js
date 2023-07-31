import { Controller } from "@hotwired/stimulus"
import 'tom-select'
import TomSelect      from "tom-select"

// Connects to data-controller="ts--select"
export default class extends Controller {
  connect() {
    console.log('tom_select_controller connected')
    const selectInput = document.getElementById('select-products')
    if (selectInput) {
      new TomSelect(selectInput, {
        plugins: {
          remove_button:{
            title:'Remove this item',
          }
        },
        onItemAdd:function(){
          this.setTextboxValue('');
          this.refreshOptions();
        },
        persist: false,
        onDelete: function(values) {
          return confirm(values.length > 1 ? 'Are you sure you want to remove these ' + values.length + ' items?' : 'Are you sure you want to remove "' + values[0] + '"?');
        }
      })
    }
  }
}