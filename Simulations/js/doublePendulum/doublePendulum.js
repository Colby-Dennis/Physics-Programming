class DoublePendulumClass {
    constructor(table) {
        this.x1 = [];
        this.y1 = [];
        this.x2 = [];
        this.y2 = [];
        this.scale = 50;
        for (let r = 0; r < table.getRowCount(); r++) {
            this.x1.push(parseFloat(table.getString(r, 1))*this.scale);
            this.y1.push(parseFloat(table.getString(r, 2))*this.scale);
            this.x2.push(parseFloat(table.getString(r, 3))*this.scale);
            this.y2.push(parseFloat(table.getString(r, 4))*this.scale);
        }
        this.diameter = 10;
        this.index = 0;
    }

    show() {
        // Drawing the lines
        line(0,0,this.x1[this.index],this.y1[this.index]);
        line(this.x1[this.index],this.y1[this.index],
            this.x2[this.index],this.y2[this.index])
        // Drawing the masses
        circle(this.x1[this.index],this.y1[this.index], this.diameter)
        circle(this.x2[this.index],this.y2[this.index], this.diameter)
    }

    update() {
        this.index = this.index + 1;
        if (this.index >= this.x1.length) {
            this.index = 0;
        }
    }
}