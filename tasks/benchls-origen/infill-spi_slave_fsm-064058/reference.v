module origen_064058 (
    input wire SCK,
    input wire SDI,
    input wire CSB,
    output reg SDO,
    output reg sdoenb,
    input wire [7:0] idata,
    output reg [7:0] odata,
    output reg [7:0] oaddr,
    output reg rdstb,
    output reg wrstb
);

    // State machine parameters
    localparam IDLE = 2'b00;
    localparam COMMAND = 2'b01;
    localparam ADDRESS = 2'b10;
    localparam DATA = 2'b11;

    reg [1:0] state, next_state;
    reg [2:0] bit_count;
    reg [2:0] byte_count;
    reg [2:0] transfer_count;
    reg write_mode, read_mode;
    reg [7:0] shift_reg;
    reg fixed_mode;

    // State machine
    always @(posedge SCK or posedge CSB) begin
        if (CSB) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end

    // Next state logic
    always @(*) begin
        case (state)
            IDLE: next_state = COMMAND;
            COMMAND: next_state = (bit_count == 3'd7) ? ADDRESS : COMMAND;
            ADDRESS: next_state = (bit_count == 3'd7) ? DATA : ADDRESS;
            DATA: begin
                if (fixed_mode) begin
                    next_state = (byte_count == transfer_count) ? COMMAND : DATA;
                end else begin
                    next_state = DATA;
                end
            end
            default: next_state = IDLE;
        endcase
    end

    // Bit counter
    always @(posedge SCK or posedge CSB) begin
        if (CSB) begin
            bit_count <= 3'd0;
        end else if (state != next_state) begin
            bit_count <= 3'd0;
        end else begin
            bit_count <= bit_count + 1'b1;
        end
    end

    // Byte counter
    always @(posedge SCK or posedge CSB) begin
        if (CSB) begin
            byte_count <= 3'd0;
        end else if (state == DATA && bit_count == 3'd7) begin
            byte_count <= byte_count + 1'b1;
        end else if (state != DATA) begin
            byte_count <= 3'd0;
        end
    end

    // Command processing
    always @(posedge SCK) begin
        if (state == COMMAND) begin
            case (bit_count)
                3'd0: write_mode <= SDI;
                3'd1: read_mode <= SDI;
                3'd2: fixed_mode <= SDI;
                3'd3: transfer_count[2] <= SDI;
                3'd4: transfer_count[1] <= SDI;
                3'd5: transfer_count[0] <= SDI;
                default: ; // Do nothing
            endcase
        end
    end

    // Address and data processing
    always @(posedge SCK) begin
        if (state == ADDRESS || (state == DATA && write_mode)) begin
            shift_reg <= {shift_reg[6:0], SDI};
        end
    end

    // Output data, address, and control signals
    always @(negedge SCK or posedge CSB) begin
        if (CSB) begin
            odata <= 8'd0;
            oaddr <= 8'd0;
            rdstb <= 1'b0;
            wrstb <= 1'b0;
            sdoenb <= 1'b1;
            SDO <= 1'b0;
        end else begin
            case (state)
                ADDRESS: begin
                    if (bit_count == 3'd7) oaddr <= shift_reg;
                end
                DATA: begin
                    if (write_mode && bit_count == 3'd7) begin
                        odata <= shift_reg;
                        wrstb <= 1'b1;
                    end else begin
                        wrstb <= 1'b0;
                    end
                    
                    if (read_mode) begin
                        sdoenb <= 1'b0;
                        SDO <= idata[7 - bit_count];
                        if (bit_count == 3'd0) rdstb <= 1'b1;
                        else rdstb <= 1'b0;
                    end else begin
                        sdoenb <= 1'b1;
                        rdstb <= 1'b0;
                    end
                    
                    if (bit_count == 3'd7 && !fixed_mode) oaddr <= oaddr + 1'b1;
                end
                default: begin
                    sdoenb <= 1'b1;
                    rdstb <= 1'b0;
                    wrstb <= 1'b0;
                end
            endcase
        end
    end

endmodule