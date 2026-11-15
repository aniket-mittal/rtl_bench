module origen_083455 (
    input wire _clk,
    input wire _rst,
    input wire _en,
    input wire [7:0] _input_reg,
    input wire [7:0] _divide_freq,
    output reg _output_wire
);

    // Parameters
    parameter RESET = 2'b00;
    parameter IDLE = 2'b01;
    parameter TRANSFER = 2'b10;
    
    parameter DATA_CAPACITY = 8;
    parameter BIT_LENGTH = 5;
    parameter EOT_KEEP_TIME = 8;

    // Internal registers
    reg [1:0] _state;
    reg [4:0] _trans_cnt;
    reg [9:0] _latch_input;
    reg _eot_flag;
    reg [7:0] _eot_cnt;
    reg [7:0] _clk_div_cnt;
    reg _clk_div;
    reg _transfer_flag;

    // State machine and main logic
    always @(posedge _clk or posedge _rst) begin
        if (_rst) begin
            _state <= RESET;
            _trans_cnt <= 0;
            _latch_input <= 0;
            _eot_flag <= 0;
            _eot_cnt <= 0;
            _clk_div_cnt <= 0;
            _clk_div <= 0;
            _transfer_flag <= 0;
            _output_wire <= 1'b0;
        end else begin
            case (_state)
                RESET: begin
                    _state <= IDLE;
                    _trans_cnt <= 0;
                    _latch_input <= 0;
                    _eot_flag <= 0;
                    _eot_cnt <= 0;
                    _clk_div_cnt <= 0;
                    _clk_div <= 0;
                    _transfer_flag <= 0;
                    _output_wire <= 1'b0;
                end

                IDLE: begin
                    if (_en && !_eot_flag) begin
                        _latch_input <= {2'b01, _input_reg};
                        _state <= TRANSFER;
                        _transfer_flag <= 1'b1;
                    end else if (_eot_flag) begin
                        if (_eot_cnt < EOT_KEEP_TIME) begin
                            _eot_cnt <= _eot_cnt + 1;
                        end else begin
                            _eot_flag <= 1'b0;
                            _eot_cnt <= 0;
                        end
                    end
                end

                TRANSFER: begin
                    if (_clk_div_cnt == _divide_freq) begin
                        _clk_div_cnt <= 0;
                        _clk_div <= ~_clk_div;
                        
                        if (_clk_div) begin
                            _output_wire <= _latch_input[BIT_LENGTH-1];
                            if (_trans_cnt == BIT_LENGTH-1) begin
                                _trans_cnt <= 0;
                                _transfer_flag <= 1'b0;
                                _eot_flag <= 1'b1;
                                _state <= IDLE;
                            end else begin
                                _trans_cnt <= _trans_cnt + 1;
                            end
                        end else begin
                            _output_wire <= ~_latch_input[BIT_LENGTH-1];
                            _latch_input <= {_latch_input[BIT_LENGTH-2:0], 1'b0};
                        end
                    end else begin
                        _clk_div_cnt <= _clk_div_cnt + 1;
                    end
                end

                default: _state <= RESET;
            endcase
        end
    end

endmodule