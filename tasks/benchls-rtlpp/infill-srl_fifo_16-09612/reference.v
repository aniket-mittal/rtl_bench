module rtlpp_09612 (
    input clock,
    input reset,
    input [15:0] i_d,     // assuming width = 16
    input i_v,
    output i_b,
    output [15:0] o_d,    // assuming width = 16
    output o_v,
    input o_b,
    output [4:0] count    // assuming depth = 16, addrwidth = 4
);

    parameter depth = 16;
    parameter width = 16;
    parameter addrwidth = 4;

    reg [addrwidth-1:0] addr, addr_;
    reg shift_en_;
    reg [width-1:0] srl [depth-2:0];
    reg shift_en_o_;
    reg [width-1:0] srlo_, srlo;
    reg [1:0] state, state_;

    wire addr_full_;
    reg addr_full;
    wire addr_zero_;
    wire o_v_reg_;
    reg o_v_reg;
    wire i_b_reg_;
    reg i_b_reg;

    assign addr_full_ = (state_ == 2'd2) && (addr_ == depth-2);
    assign addr_zero_ = (addr == 0);
    assign o_v_reg_ = (state != 2'd0);
    assign i_b_reg_ = addr_full_;
    assign o_d = srlo;
    assign o_v = o_v_reg;
    assign i_b = i_b_reg;

    assign count = (state == 2'd2 ? addr + 2 : (state == 2'd1 ? 1 : 0));

    always @(posedge clock) begin
        if (reset) begin
            state <= 2'd0;
            addr <= 0;
            addr_full <= 0;
            o_v_reg <= 0;
            i_b_reg <= 1;
        end else begin
            state <= state_;
            addr <= addr_;
            addr_full <= addr_full_;
            o_v_reg <= o_v_reg_;
            i_b_reg <= i_b_reg_;
        end
    end

    always @(posedge clock) begin
        if (reset) begin
            srlo <= 0;
        end else begin
            if (shift_en_o_) begin
                srlo <= srlo_;
            end
        end
    end

    always @(posedge clock) begin
        if (shift_en_) begin
            integer a_;
            for (a_ = depth - 2; a_ > 0; a_ = a_ - 1) begin
                srl[a_] <= srl[a_ - 1];
            end
            srl[0] <= i_d;
        end
    end

    always @* begin
        srlo_ <= 16'bx;        // assuming width = 16
        shift_en_o_ <= 1'bx;
        shift_en_ <= 1'bx;
        addr_ <= 4'bx;        // assuming addrwidth = 4
        state_ <= 2'bx;

        case (state)
            2'd0: begin
                if (i_v) begin
                    srlo_ <= i_d;
                    shift_en_o_ <= 1;
                    shift_en_ <= 1'bx;
                    addr_ <= 0;
                    state_ <= 2'd1;
                end else begin
                    srlo_ <= 16'bx;        // assuming width = 16
                    shift_en_o_ <= 0;
                    shift_en_ <= 1'bx;
                    addr_ <= 0;
                    state_ <= 2'd0;
                end
            end

            2'd1: begin
                if (i_v && o_b) begin
                    srlo_ <= 16'bx;        // assuming width = 16
                    shift_en_o_ <= 0;
                    shift_en_ <= 1;
                    addr_ <= 0;
                    state_ <= 2'd2;
                end else if (i_v && !o_b) begin
                    srlo_ <= i_d;
                    shift_en_o_ <= 1;
                    shift_en_ <= 1;
                    addr_ <= 0;
                    state_ <= 2'd1;
                end else if (!i_v && o_b) begin
                    srlo_ <= 16'bx;        // assuming width = 16
                    shift_en_o_ <= 0;
                    shift_en_ <= 1'bx;
                    addr_ <= 0;
                    state_ <= 2'd1;
                end else if (!i_v && !o_b) begin
                    srlo_ <= 16'bx;        // assuming width = 16
                    shift_en_o_ <= 0;
                    shift_en_ <= 1'bx;
                    addr_ <= 0;
                    state_ <= 2'd0;
                end
            end

            2'd2: begin
                if (addr_full || (depth == 2)) begin
                    if (o_b) begin
                        srlo_ <= 16'bx;        // assuming width = 16
                        shift_en_o_ <= 0;
                        shift_en_ <= 0;
                        addr_ <= addr;
                        state_ <= 2'd2;
                    end else begin
                        srlo_ <= srl[addr];
                        shift_en_o_ <= 1;
                        shift_en_ <= 0;
                        addr_ <= addr_zero_ ? 0 : addr - 1;
                        state_ <= addr_zero_ ? 2'd1 : 2'd2;
                    end
                end else begin
                    if (i_v && o_b) begin
                        srlo_ <= 16'bx;        // assuming width = 16
                        shift_en_o_ <= 0;
                        shift_en_ <= 1;
                        addr_ <= addr + 1;
                        state_ <= 2'd2;
                    end else if (i_v && !o_b) begin
                        srlo_ <= srl[addr];
                        shift_en_o_ <= 1;
                        shift_en_ <= 1;
                        addr_ <= addr;
                        state_ <= 2'd2;
                    end else if (!i_v && o_b) begin
                        srlo_ <= 16'bx;        // assuming width = 16
                        shift_en_o_ <= 0;
                        shift_en_ <= 0;
                        addr_ <= addr;
                        state_ <= 2'd2;
                    end else if (!i_v && !o_b) begin
                        srlo_ <= srl[addr];
                        shift_en_o_ <= 1;
                        shift_en_ <= 0;
                        addr_ <= addr_zero_ ? 0 : addr - 1;
                        state_ <= addr_zero_ ? 2'd1 : 2'd2;
                    end
                end
            end

            default: begin
                srlo_ <= 16'bx;        // assuming width = 16
                shift_en_o_ <= 1'bx;
                shift_en_ <= 1'bx;
                addr_ <= 4'bx;        // assuming addrwidth = 4
                state_ <= 2'bx;
            end

        endcase
    end

endmodule