module origen_119880 #(
    parameter N = 16,
    parameter M = 4,
    parameter T = 32,
    parameter Cb = 5,
    parameter MODE = 0
)(
    input wire clk,
    input wire nR,
    input wire newIN,
    input wire [4*N-1:0] in,
    input wire loadData,
    input wire loadKey,
    input wire doneData,
    input wire doneKey,
    output reg loadPkt,
    output reg donePkt,
    output reg [7:0] infoIN,
    output reg [Cb-1:0] countIN,
    output reg newKey,
    output reg newData,
    output reg enc_dec,
    output reg [N-1:0] blockIN,
    output reg [M*N-1:0] KEY
);

    // FSM states
    localparam WAIT = 2'b00, LOAD = 2'b01, COMPUTE = 2'b10, WRITE = 2'b11;
    reg [1:0] state, next_state;

    // Internal registers
    reg [4*N-1:0] data_reg;
    reg [Cb-1:0] count_reg;
    reg [7:0] info_reg;
    reg [1:0] nBLOCK;

    // FSM state transition
    always @(posedge clk or negedge nR) begin
        if (~nR)
            state <= WAIT;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            WAIT: next_state = newIN ? LOAD : WAIT;
            LOAD: next_state = COMPUTE;
            COMPUTE: next_state = WRITE;
            WRITE: next_state = WAIT;
            default: next_state = WAIT;
        endcase
    end

    // Main logic
    always @(posedge clk or negedge nR) begin
        if (~nR) begin
            loadPkt <= 0;
            donePkt <= 0;
            infoIN <= 0;
            countIN <= 0;
            newKey <= 0;
            newData <= 0;
            enc_dec <= 0;
            blockIN <= 0;
            KEY <= 0;
            data_reg <= 0;
            count_reg <= 0;
            info_reg <= 0;
            nBLOCK <= 0;
        end else begin
            case (state)
                LOAD: begin
                    data_reg <= in;
                    count_reg <= in[4*N-1:4*N-Cb];
                    info_reg <= in[4*N-Cb-1:4*N-Cb-8];
                    loadPkt <= 1;
                end
                COMPUTE: begin
                    loadPkt <= 0;
                    // Error checking
                    if (count_reg != countIN + 1 || info_reg[7:6] != MODE || (info_reg[5] && ~loadKey) || (~info_reg[5] && ~loadData)) begin
                        next_state = WAIT;
                    end else begin
                        infoIN <= info_reg;
                        countIN <= count_reg;
                        enc_dec <= info_reg[4];
                        nBLOCK <= info_reg[1:0];
                    end
                end
                WRITE: begin
                    if (info_reg[5]) begin // Key
                        KEY <= data_reg;
                        newKey <= 1;
                    end else begin // Data
                        case (nBLOCK)
                            2'b00: blockIN <= data_reg[N-1:0];
                            2'b01: blockIN <= data_reg[2*N-1:N];
                            2'b10: blockIN <= data_reg[3*N-1:2*N];
                            2'b11: blockIN <= data_reg[4*N-1:3*N];
                        endcase
                        newData <= 1;
                    end
                    donePkt <= 1;
                end
                WAIT: begin
                    newKey <= 0;
                    newData <= 0;
                    donePkt <= 0;
                end
            endcase
        end
    end

endmodule