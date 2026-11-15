module mux(sel, src0, src1, z);
	input sel;
	input src0, src1;
	output z;
	assign z = sel ? src1 : src0;
endmodule

module rtlpp_09296 (
    clk, rst, FLIT_in, VALID_in, FWDAUX1_in, BWDAUX1_out, BWDAUX2_out, BWDAUX3_out, flit_out, request_out, busy_out
);

    parameter FLIT_WIDTH = 32;

    reg    [5 : 0] CS, NS;

    input  clk, rst;

    input  [FLIT_WIDTH - 1 : 0] FLIT_in;
    input  VALID_in;
    input  FWDAUX1_in;       
    output BWDAUX1_out;      
    reg    BWDAUX1_out;
    output BWDAUX2_out;      
    output BWDAUX3_out;      

    output [FLIT_WIDTH - 1 : 0] flit_out;
    reg    [FLIT_WIDTH - 1 : 0] flit_out;
    output request_out;
    reg    request_out;
    input  busy_out;

    reg    [FLIT_WIDTH - 1 : 0] flit [4 : 0];
    reg    [FLIT_WIDTH - 1 : 0] mux_out;
    reg    enable_0, enable_all;
    reg    [5 : 0] sel;
    integer loop;

    assign BWDAUX2_out = 1'b0;
    assign BWDAUX3_out = 1'b0;

    always @(posedge clk or posedge rst)
        begin: update_fsm
            if (rst)
                CS <= 6'b000000;
            else
                CS <= NS;
        end

    always @(CS or VALID_in or busy_out)
        begin: compute_fsm_state
            case (CS)
                6'b000000: NS <= (VALID_in) ? 6'b000001 : 6'b000000;
                6'b000001: NS <= (!VALID_in && !busy_out) ? 6'b000000 : ((VALID_in && !busy_out) || (!VALID_in && busy_out)) ? 6'b000001 : 6'b000010;
                6'b000010: NS <= (!VALID_in && !busy_out) ? 6'b000001 : ((VALID_in && !busy_out) || (!VALID_in && busy_out)) ? 6'b000010 : 6'b000011;
                6'b000011: NS <= (!VALID_in && !busy_out) ? 6'b000010 : ((VALID_in && !busy_out) || (!VALID_in && busy_out)) ? 6'b000011 : 6'b000100;
                6'b000100: NS <= (!VALID_in && !busy_out) ? 6'b000011 : ((VALID_in && !busy_out) || (!VALID_in && busy_out)) ? 6'b000100 : 6'b000101;
                6'b000101: NS <= (!VALID_in && !busy_out) ? 6'b000100 : ((VALID_in && !busy_out) || (!VALID_in && busy_out)) ? 6'b000101 : 6'b000110;
                6'b000110: NS <= (busy_out) ? 6'b000110 : 6'b000101;
                default : NS <= 6'b000000;
            endcase
        end

    always @(CS or VALID_in or busy_out)
        begin: compute_output
            case (CS)
                6'b000000: begin
                    enable_0 <= VALID_in ? 1'b1 : 1'bx;
                    enable_all <= 1'bx;
                    sel <= 6'b000001;
                    request_out <= 1'b0;
                    BWDAUX1_out <= 1'b0;
                end
                6'b000001: begin
                    enable_0 <= (VALID_in && !busy_out) ? 1'b1 : 1'b0;
                    enable_all <= (VALID_in && busy_out) ? 1'b1 : 1'bx;
                    sel <= 6'b000001;
                    request_out <= 1'b1;
                    BWDAUX1_out <= 1'b0;
                end
                6'b000010: begin
                    enable_0 <= !busy_out ? 1'b1 : 1'b0;
                    enable_all <= VALID_in ? 1'b1 : 1'b0;
                    sel <= 6'b000010;
                    request_out <= 1'b1;
                    BWDAUX1_out <= 1'b0;
                end
                6'b000011: begin
                    enable_0 <= !busy_out ? 1'b1 : 1'b0;
                    enable_all <= VALID_in ? 1'b1 : 1'b0;
                    sel <= 6'b000100;
                    request_out <= 1'b1;
                    BWDAUX1_out <= 1'b0;
                end
                6'b000100: begin
                    enable_0 <= !busy_out ? 1'b1 : 1'b0;
                    enable_all <= VALID_in ? 1'b1 : 1'b0;
                    sel <= 6'b001000;
                    request_out <= 1'b1;
                    BWDAUX1_out <= 1'b0;
                end
                6'b000101: begin
                    enable_0 <= !busy_out ? 1'b1 : 1'b0;
                    enable_all <= VALID_in ? 1'b1 : 1'b0;
                    sel <= 6'b010000;
                    request_out <= 1'b1;
                    BWDAUX1_out <= 1'b0;
                end
                6'b000110: begin
                    enable_0 <= !busy_out ? 1'b1 : 1'b0;
                    enable_all <= 1'b0;
                    sel <= 6'b100000;
                    request_out <= 1'b1;
                    BWDAUX1_out <= 1'b1;
                end
                default: begin
                    enable_0 <= 1'bx;
                    enable_all <= 1'bx;
                    sel <= 6'b000001;
                    request_out <= 1'b0;
                    BWDAUX1_out <= 1'b0;
                end
            endcase
        end

    always @(FLIT_in or sel or flit[0] or flit[1] or flit[2] or flit[3] or flit[4])
        begin: mux
            case (sel)
                6'b000001: mux_out <= FLIT_in;
                6'b000010: mux_out <= flit[0];
                6'b000100: mux_out <= flit[1];
                6'b001000: mux_out <= flit[2];
                6'b010000: mux_out <= flit[3];
                6'b100000: mux_out <= flit[4];
                default: mux_out <= flit[0];
            endcase
        end

    always @(posedge clk or posedge rst)
        begin: flip_flop
            if (rst)
            begin
                flit_out <= 0;
                for (loop = 0; loop < 5; loop = loop + 1)
                    flit[loop] <= 0;
            end
            else
            begin
                if (enable_0 == 1'b1)
                    flit_out <= mux_out;
                if (enable_all == 1'b1)
                begin
                    flit[0] <= FLIT_in;
                    for (loop = 1; loop < 5; loop = loop + 1)
                        flit[loop] <= flit[loop - 1];
                end
            end
        end

endmodule