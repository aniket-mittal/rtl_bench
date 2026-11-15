module origen_142538 (
    input wire clk,
    input wire rst_n,
    input wire clkps2,
    input wire dataps2,
    input wire [15:0] a,
    input wire iorq_n,
    input wire rd_n,
    input wire [7:0] zxuno_addr,
    input wire zxuno_regrd,
    input wire zxuno_regwr,
    input wire [7:0] din,
    output reg [7:0] kmouse_dout,
    output wire oe_n_kmouse,
    output reg [7:0] mousedata_dout,
    output wire oe_n_mousedata,
    output reg [7:0] mousestatus_dout,
    output wire oe_n_mousestatus
);

    // PS/2 mouse state machine
    reg [2:0] ps2_state;
    reg [7:0] ps2_data;
    reg [3:0] ps2_bit_count;
    reg ps2_parity;

    // Mouse movement and button status
    reg [7:0] mouse_x;
    reg [7:0] mouse_y;
    reg [2:0] mouse_buttons;

    // Mouse status
    reg [6:0] mouse_status;

    // Kempston joystick port address
    localparam KEMPSTON_ADDR = 16'h1F;

    // PS/2 mouse state machine states
    localparam IDLE = 3'd0;
    localparam START = 3'd1;
    localparam DATA = 3'd2;
    localparam PARITY = 3'd3;
    localparam STOP = 3'd4;

    // PS/2 mouse packet processing
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            ps2_state <= IDLE;
            ps2_bit_count <= 4'd0;
            ps2_data <= 8'd0;
            ps2_parity <= 1'b0;
        end else begin
            case (ps2_state)
                IDLE: begin
                    if (!clkps2 && !dataps2) begin
                        ps2_state <= START;
                    end
                end
                START: begin
                    if (clkps2) begin
                        ps2_state <= DATA;
                        ps2_bit_count <= 4'd0;
                        ps2_data <= 8'd0;
                        ps2_parity <= 1'b0;
                    end
                end
                DATA: begin
                    if (!clkps2) begin
                        ps2_data <= {dataps2, ps2_data[7:1]};
                        ps2_parity <= ps2_parity ^ dataps2;
                        ps2_bit_count <= ps2_bit_count + 1'b1;
                        if (ps2_bit_count == 4'd7) begin
                            ps2_state <= PARITY;
                        end
                    end
                end
                PARITY: begin
                    if (!clkps2) begin
                        if (dataps2 == ps2_parity) begin
                            ps2_state <= STOP;
                        end else begin
                            ps2_state <= IDLE;
                        end
                    end
                end
                STOP: begin
                    if (!clkps2 && dataps2) begin
                        // Process received PS/2 data
                        case (ps2_bit_count)
                            4'd0: begin
                                mouse_buttons <= ps2_data[2:0];
                                mouse_status[6:4] <= ps2_data[5:3];
                            end
                            4'd1: mouse_x <= ps2_data;
                            4'd2: mouse_y <= ps2_data;
                        endcase
                        ps2_bit_count <= (ps2_bit_count == 4'd2) ? 4'd0 : ps2_bit_count + 1'b1;
                        ps2_state <= IDLE;
                    end
                end
            endcase
        end
    end

    // Kempston joystick port interface
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            kmouse_dout <= 8'd0;
            mousedata_dout <= 8'd0;
            mousestatus_dout <= 8'd0;
        end else begin
            if (!iorq_n && !rd_n && a == KEMPSTON_ADDR) begin
                kmouse_dout <= {5'b00000, mouse_buttons};
            end
            if (!zxuno_regrd) begin
                case (zxuno_addr)
                    8'hFC: mousedata_dout <= mouse_x;
                    8'hFD: mousedata_dout <= mouse_y;
                    8'hFE: mousestatus_dout <= {1'b0, mouse_status};
                endcase
            end
        end
    end

    // Output enable signals
    assign oe_n_kmouse = !((!iorq_n && !rd_n && a == KEMPSTON_ADDR) || (!zxuno_regrd && zxuno_addr == 8'hFB));
    assign oe_n_mousedata = !(!zxuno_regrd && (zxuno_addr == 8'hFC || zxuno_addr == 8'hFD));
    assign oe_n_mousestatus = !(!zxuno_regrd && zxuno_addr == 8'hFE);

endmodule