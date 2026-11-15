module origen_106430 (
    input wire sys_clk,
    input wire sys_rst_n,
    input wire coin5_flag,
    input wire coin10_flag,
    input wire reset_flag,
    output reg [7:0] paid,
    output reg [7:0] change,
    output reg open
);

    // State encoding
    localparam [2:0] S0 = 3'b000,  // 0 units
                     S1 = 3'b001,  // 5 units
                     S2 = 3'b010,  // 10 units
                     S3 = 3'b011,  // 15 units (dispense)
                     S4 = 3'b100;  // 20 units (dispense + change)

    reg [2:0] cstate, nstate;

    // State register
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (~sys_rst_n)
            cstate <= S0;
        else
            cstate <= nstate;
    end

    // Next state logic and output logic
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (~sys_rst_n) begin
            nstate <= S0;
            paid <= 8'd0;
            change <= 8'd0;
            open <= 1'b0;
        end
        else begin
            case (cstate)
                S0: begin
                    if (coin5_flag) begin
                        nstate <= S1;
                        paid <= 8'd5;
                    end
                    else if (coin10_flag) begin
                        nstate <= S2;
                        paid <= 8'd10;
                    end
                    else
                        nstate <= S0;
                    change <= 8'd0;
                    open <= 1'b0;
                end

                S1: begin
                    if (coin5_flag) begin
                        nstate <= S2;
                        paid <= 8'd10;
                    end
                    else if (coin10_flag) begin
                        nstate <= S3;
                        paid <= 8'd15;
                        open <= 1'b1;
                    end
                    else
                        nstate <= S1;
                    change <= 8'd0;
                end

                S2: begin
                    if (coin5_flag) begin
                        nstate <= S3;
                        paid <= 8'd15;
                        open <= 1'b1;
                    end
                    else if (coin10_flag) begin
                        nstate <= S4;
                        paid <= 8'd20;
                        change <= 8'd5;
                        open <= 1'b1;
                    end
                    else
                        nstate <= S2;
                end

                S3: begin
                    if (reset_flag)
                        nstate <= S0;
                    else
                        nstate <= S3;
                    paid <= 8'd15;
                    change <= 8'd0;
                    open <= 1'b1;
                end

                S4: begin
                    if (reset_flag)
                        nstate <= S0;
                    else
                        nstate <= S4;
                    paid <= 8'd20;
                    change <= 8'd5;
                    open <= 1'b1;
                end

                default: nstate <= S0;
            endcase
        end
    end

endmodule