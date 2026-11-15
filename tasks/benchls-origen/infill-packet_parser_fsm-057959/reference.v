module origen_057959 (
    input wire clk,
    input wire rst,
    input wire fs,
    output reg fd,
    output reg fifoc_rxen,
    input wire [7:0] fifoc_rxd,
    output reg [7:0] kind_dev,
    output reg [7:0] info_sr,
    output reg [7:0] cmd_filt,
    output reg [7:0] cmd_mix0,
    output reg [7:0] cmd_mix1,
    output reg [7:0] cmd_reg4,
    output reg [7:0] cmd_reg5,
    output reg [7:0] cmd_reg6,
    output reg [7:0] cmd_reg7,
    output reg err
);

    // State definitions
    localparam [4:0] 
        IDLE = 5'd0,
        HEAD1 = 5'd1,
        HEAD2 = 5'd2,
        CMD1 = 5'd3,
        CMD2 = 5'd4,
        CMD3 = 5'd5,
        CMD4 = 5'd6,
        CMD5 = 5'd7,
        CMD6 = 5'd8,
        CMD7 = 5'd9,
        CMD8 = 5'd10,
        CMD9 = 5'd11,
        CHKSUM = 5'd12,
        LAST = 5'd13,
        ERR = 5'd14;

    reg [4:0] state, next_state;
    reg [7:0] checksum;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            fd <= 0;
            fifoc_rxen <= 0;
            kind_dev <= 0;
            info_sr <= 0;
            cmd_filt <= 0;
            cmd_mix0 <= 0;
            cmd_mix1 <= 0;
            cmd_reg4 <= 0;
            cmd_reg5 <= 0;
            cmd_reg6 <= 0;
            cmd_reg7 <= 0;
            err <= 0;
            checksum <= 0;
        end else begin
            state <= next_state;
            case (state)
                IDLE: begin
                    fd <= 0;
                    fifoc_rxen <= 0;
                    err <= 0;
                    checksum <= 0;
                    if (fs) fifoc_rxen <= 1;
                end
                HEAD1: if (fifoc_rxd != 8'h55) next_state <= ERR;
                HEAD2: if (fifoc_rxd != 8'hAA) next_state <= ERR;
                CMD1: begin kind_dev <= fifoc_rxd; checksum <= checksum + fifoc_rxd; end
                CMD2: begin info_sr <= fifoc_rxd; checksum <= checksum + fifoc_rxd; end
                CMD3: begin cmd_filt <= fifoc_rxd; checksum <= checksum + fifoc_rxd; end
                CMD4: begin cmd_mix0 <= fifoc_rxd; checksum <= checksum + fifoc_rxd; end
                CMD5: begin cmd_mix1 <= fifoc_rxd; checksum <= checksum + fifoc_rxd; end
                CMD6: begin cmd_reg4 <= fifoc_rxd; checksum <= checksum + fifoc_rxd; end
                CMD7: begin cmd_reg5 <= fifoc_rxd; checksum <= checksum + fifoc_rxd; end
                CMD8: begin cmd_reg6 <= fifoc_rxd; checksum <= checksum + fifoc_rxd; end
                CMD9: begin cmd_reg7 <= fifoc_rxd; checksum <= checksum + fifoc_rxd; end
                CHKSUM: begin
                    fifoc_rxen <= 0;
                    if (fifoc_rxd != checksum) next_state <= ERR;
                end
                LAST: fd <= 1;
                ERR: begin
                    err <= 1;
                    fifoc_rxen <= 0;
                end
            endcase
        end
    end

    always @(*) begin
        next_state = state;
        case (state)
            IDLE: if (fs) next_state = HEAD1;
            HEAD1: next_state = HEAD2;
            HEAD2: next_state = CMD1;
            CMD1: next_state = CMD2;
            CMD2: next_state = CMD3;
            CMD3: next_state = CMD4;
            CMD4: next_state = CMD5;
            CMD5: next_state = CMD6;
            CMD6: next_state = CMD7;
            CMD7: next_state = CMD8;
            CMD8: next_state = CMD9;
            CMD9: next_state = CHKSUM;
            CHKSUM: next_state = LAST;
            LAST: next_state = IDLE;
            ERR: next_state = IDLE;
        endcase
    end

endmodule