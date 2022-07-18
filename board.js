class Board {
    constructor() {
        this.state = new Array(5).fill(new Array(5).fill(null));
        this.state[0] =
            [{ color: 'r', num: 5 }, { color: 'r', num: 4 }, { color: 'r', num: 1 }, { color: 'r', num: 3 }, { color: 'r', num: 2 }];
        this.state[4] =
            [{ color: 'b', num: 2 }, { color: 'b', num: 3 }, { color: 'b', num: 1 }, { color: 'b', num: 4 }, { color: 'b', num: 5 }];
    }

    check_win_condition_2() {
        if (this.state[0, 2] && this.state[0, 2].num === 1) return this.state[0, 2].color === 'b' ? [true, 'b'] : false;
        if (this.state[4, 2] && this.state[4, 2].num === 1) return this.state[0, 2].color === 'r' ? [true, 'r'] : false;
    }
};

module.exports = Board;
