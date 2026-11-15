module origen_142515 (
    input wire clk,
    input wire rst,
    input wire [31:0] addrbase,
    input wire [31:0] addrofs,
    input wire [3:0] lsu_op,
    input wire [31:0] lsu_datain,
    input wire du_stall,
    output reg except_align,
    output reg except_dtlbmiss,
    output reg except_dmmufault,
    output reg except_dbuserr,
    output reg [31:0] lsu_dataout,
    output reg lsu_stall,
    output reg lsu_unstall,
    output reg [31:0] dcpu_adr_o,
    output reg dcpu_cycstb_o,
    output reg dcpu_we_o,
    output reg [3:0] dcpu_sel_o,
    output reg [3:0] dcpu_tag_o,
    output reg [31:0] dcpu_dat_o,
    input wire [31:0] dcpu_dat_i,
    input wire dcpu_ack_i,
    input wire dcpu_rty_i,
    input wire dcpu_err_i,
    input wire [3:0] dcpu_tag_i
);

    // State machine states
    localparam IDLE = 2'b00;
    localparam ACTIVE = 2'b01;
    localparam WAIT_ACK = 2'b10;
    reg [1:0] state, next_state;

    // Operation types
    localparam SB  = 4'b0000;
    localparam SH  = 4'b0001;
    localparam SW  = 4'b0010;
    localparam LBZ = 4'b0100;
    localparam LBS = 4'b0101;
    localparam LHZ = 4'b0110;
    localparam LHS = 4'b0111;
    localparam LWZ = 4'b1000;
    localparam LWS = 4'b1001;

    // Internal signals
    reg [31:0] effective_address;
    reg [3:0] byte_enable;
    reg is_write_op;

    // State machine
    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            IDLE: next_state = (lsu_op != 4'b0000 && !du_stall) ? ACTIVE : IDLE;
            ACTIVE: next_state = WAIT_ACK;
            WAIT_ACK: begin
                if (dcpu_ack_i)
                    next_state = IDLE;
                else if (dcpu_rty_i)
                    next_state = ACTIVE;
                else
                    next_state = WAIT_ACK;
            end
            default: next_state = IDLE;
        endcase
    end

    // Combinational logic
    always @(*) begin
        // Default values
        except_align = 1'b0;
        except_dtlbmiss = 1'b0;
        except_dmmufault = 1'b0;
        except_dbuserr = 1'b0;
        lsu_stall = (state != IDLE);
        lsu_unstall = (state == WAIT_ACK && dcpu_ack_i);
        effective_address = addrbase + addrofs;
        is_write_op = (lsu_op[3:2] == 2'b00);

        // Determine byte enable based on operation
        case (lsu_op)
            SB:  byte_enable = 4'b0001 << effective_address[1:0];
            SH:  byte_enable = 4'b0011 << {effective_address[1], 1'b0};
            SW:  byte_enable = 4'b1111;
            default: byte_enable = 4'b1111;
        endcase

        // Check for alignment exceptions
        if ((lsu_op == SH || lsu_op == LHZ || lsu_op == LHS) && effective_address[0])
            except_align = 1'b1;
        else if ((lsu_op == SW || lsu_op == LWZ || lsu_op == LWS) && effective_address[1:0] != 2'b00)
            except_align = 1'b1;

        // Set outputs
        dcpu_adr_o = effective_address;
        dcpu_cycstb_o = (state == ACTIVE);
        dcpu_we_o = is_write_op;
        dcpu_sel_o = byte_enable;
        dcpu_tag_o = lsu_op;
        dcpu_dat_o = lsu_datain;

        // Handle read operations
        if (!is_write_op && state == WAIT_ACK && dcpu_ack_i) begin
            case (lsu_op)
                LBZ: lsu_dataout = {24'b0, dcpu_dat_i[7:0]};
                LBS: lsu_dataout = {{24{dcpu_dat_i[7]}}, dcpu_dat_i[7:0]};
                LHZ: lsu_dataout = {16'b0, dcpu_dat_i[15:0]};
                LHS: lsu_dataout = {{16{dcpu_dat_i[15]}}, dcpu_dat_i[15:0]};
                LWZ, LWS: lsu_dataout = dcpu_dat_i;
                default: lsu_dataout = 32'b0;
            endcase
        end

        // Handle exceptions
        if (dcpu_err_i) begin
            except_dbuserr = 1'b1;
        end
    end

endmodule