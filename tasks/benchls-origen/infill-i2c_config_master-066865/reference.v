module origen_066865(
    input wire reset,
    input wire clk2,
    input wire sda,
    input wire clk1,
    input wire [15:0] data,
    output reg [7:0] reg_address,
    output reg sda_w,
    output reg ctrl_h
);

    reg [2:0] fsm;
    reg [4:0] add_con;
    reg [7:0] address_ba;
    reg [1:0] mode;
    reg sda_r;

    always @(negedge clk2 or posedge reset) begin
        if (reset) begin
            fsm <= 3'd0;
            add_con <= 5'd0;
            address_ba <= 8'hBA;
            mode <= 2'd0;
            reg_address <= 8'd0;
            sda_w <= 1'b1;
            ctrl_h <= 1'b1;
        end else begin
            sda_r <= sda;
            case (fsm)
                3'd0: begin // Idle state
                    sda_w <= 1'b1;
                    ctrl_h <= 1'b1;
                    fsm <= 3'd1;
                end
                3'd1: begin // Start condition
                    sda_w <= 1'b0;
                    ctrl_h <= 1'b1;
                    add_con <= 5'd0;
                    fsm <= 3'd2;
                end
                3'd2: begin // Data transmission
                    ctrl_h <= 1'b0;
                    case (mode)
                        2'd0: sda_w <= address_ba[7-add_con];
                        2'd1: sda_w <= reg_address[7-add_con];
                        2'd2: sda_w <= data[15-add_con];
                        2'd3: sda_w <= data[7-add_con];
                    endcase
                    if (add_con == 5'd7) begin
                        fsm <= 3'd3;
                        add_con <= 5'd0;
                    end else begin
                        add_con <= add_con + 1'b1;
                    end
                end
                3'd3: begin // Check ACK
                    ctrl_h <= 1'b1;
                    if (sda_r == 1'b0) begin
                        if (mode == 2'd3) begin
                            fsm <= 3'd5;
                        end else if (mode == 2'd1) begin
                            fsm <= 3'd4;
                        end else begin
                            mode <= mode + 1'b1;
                            fsm <= 3'd2;
                        end
                    end else begin
                        fsm <= 3'd0;
                    end
                end
                3'd4: begin // Repeated start
                    sda_w <= 1'b1;
                    ctrl_h <= 1'b1;
                    fsm <= 3'd1;
                end
                3'd5: begin // Check register address
                    if (reg_address == 8'hFF) begin
                        fsm <= 3'd0;
                    end else begin
                        reg_address <= reg_address + 1'b1;
                        mode <= 2'd0;
                        fsm <= 3'd1;
                    end
                end
                default: fsm <= 3'd0;
            endcase
        end
    end

endmodule