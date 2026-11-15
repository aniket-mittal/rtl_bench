module origen_012974 (
    input wire reset,
    input wire clk,
    input wire dp,
    input wire dm,
    input wire enable,
    output reg eop_r,
    output reg [7:0] rdata,
    output reg rdata_ready,
    output reg [7:0] rbyte_cnt,
    output reg eop_rfe
);

    reg [1:0] dp_r, dm_r;
    reg [2:0] state;
    reg [2:0] bit_count;
    reg [2:0] clk_counter;
    reg [2:0] num_ones;
    reg do_remove_zero;
    reg r_strobe;
    reg recv_enable;

    localparam IDLE = 3'b000;
    localparam RECEIVING = 3'b001;
    localparam EOP = 3'b010;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            eop_r <= 0;
            rdata <= 8'b0;
            rdata_ready <= 0;
            rbyte_cnt <= 8'b0;
            eop_rfe <= 0;
            dp_r <= 2'b11;
            dm_r <= 2'b00;
            bit_count <= 3'b0;
            clk_counter <= 3'b0;
            num_ones <= 3'b0;
            do_remove_zero <= 0;
            r_strobe <= 0;
            recv_enable <= 0;
        end else begin
            dp_r <= {dp_r[0], dp};
            dm_r <= {dm_r[0], dm};

            // EOP detection
            eop_r <= (dp_r == 2'b00) && (dm_r == 2'b00);
            eop_rfe <= eop_r && recv_enable;

            // Receiver enable control
            if (enable && dp_r[0] && !recv_enable)
                recv_enable <= 1;
            else if (eop_rfe || reset)
                recv_enable <= 0;

            // Clock recovery
            if (recv_enable) begin
                if (dp_r[1] != dp_r[0])
                    clk_counter <= 3'b0;
                else if (clk_counter < 3'b111)
                    clk_counter <= clk_counter + 1;

                r_strobe <= (clk_counter == 3'b011);
            end else begin
                clk_counter <= 3'b0;
                r_strobe <= 0;
            end

            // Bit stuffing removal and data reception
            if (r_strobe && recv_enable) begin
                if (!do_remove_zero) begin
                    rdata <= {dp_r[0], rdata[7:1]};
                    bit_count <= bit_count + 1;

                    if (dp_r[0])
                        num_ones <= num_ones + 1;
                    else
                        num_ones <= 3'b0;

                    do_remove_zero <= (num_ones == 3'b110);
                end else begin
                    do_remove_zero <= 0;
                    num_ones <= 3'b0;
                end

                if (bit_count == 3'b111) begin
                    rdata_ready <= 1;
                    rbyte_cnt <= rbyte_cnt + 1;
                end else begin
                    rdata_ready <= 0;
                end
            end else begin
                rdata_ready <= 0;
            end

            // State transitions
            case (state)
                IDLE:
                    if (recv_enable)
                        state <= RECEIVING;
                RECEIVING:
                    if (eop_rfe) begin
                        state <= EOP;
                        rbyte_cnt <= 8'b0;
                    end
                EOP:
                    state <= IDLE;
            endcase
        end
    end

endmodule