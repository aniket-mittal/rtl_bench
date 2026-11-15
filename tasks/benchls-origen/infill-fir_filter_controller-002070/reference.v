module origen_002070 (
    input wire Sclk, Dclk, Frame, S2P_status, sleep_status, Reset_n,
    input wire [31:0] col,
    output reg rj_status, coeff_status, in_status, alu_status,
    output reg [7:0] address_rj, address_coeff, address_in,
    output reg [9:0] cont_address,
    output reg InReady, Start, clear, set
);

    reg [3:0] state, next_state;
    reg [7:0] rj_counter, coeff_counter, in_counter;
    reg [9:0] cont_counter;
    reg frame_reg, s2p_reg;

    // State definitions
    localparam IDLE = 4'd0,
               LOAD_RJ = 4'd1,
               LOAD_COEFF = 4'd2,
               PROCESS_INPUT = 4'd3,
               WAIT_S2P = 4'd4,
               UPDATE_ADDR = 4'd5,
               CHECK_FRAME = 4'd6,
               SLEEP = 4'd7,
               RESUME = 4'd8,
               RESET = 4'd9;

    // State machine
    always @(posedge Sclk or negedge Reset_n) begin
        if (!Reset_n)
            state <= RESET;
        else if (sleep_status)
            state <= SLEEP;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            IDLE: next_state = Frame ? LOAD_RJ : IDLE;
            LOAD_RJ: next_state = (rj_counter == col - 1) ? LOAD_COEFF : LOAD_RJ;
            LOAD_COEFF: next_state = (coeff_counter == col - 1) ? PROCESS_INPUT : LOAD_COEFF;
            PROCESS_INPUT: next_state = S2P_status ? WAIT_S2P : PROCESS_INPUT;
            WAIT_S2P: next_state = UPDATE_ADDR;
            UPDATE_ADDR: next_state = CHECK_FRAME;
            CHECK_FRAME: next_state = Frame ? LOAD_RJ : (in_counter == col - 1) ? IDLE : PROCESS_INPUT;
            SLEEP: next_state = sleep_status ? SLEEP : RESUME;
            RESUME: next_state = CHECK_FRAME;
            RESET: next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end

    // Output and counter logic
    always @(posedge Sclk or negedge Reset_n) begin
        if (!Reset_n) begin
            {rj_status, coeff_status, in_status, alu_status} <= 4'b0000;
            {address_rj, address_coeff, address_in, cont_address} <= 34'b0;
            {InReady, Start, clear, set} <= 4'b0000;
            {rj_counter, coeff_counter, in_counter, cont_counter} <= 34'b0;
        end else begin
            case (state)
                IDLE: begin
                    {rj_status, coeff_status, in_status, alu_status} <= 4'b0000;
                    {InReady, Start, clear, set} <= 4'b0000;
                end
                LOAD_RJ: begin
                    rj_status <= 1'b1;
                    address_rj <= rj_counter;
                    rj_counter <= rj_counter + 1;
                end
                LOAD_COEFF: begin
                    coeff_status <= 1'b1;
                    address_coeff <= coeff_counter;
                    coeff_counter <= coeff_counter + 1;
                end
                PROCESS_INPUT: begin
                    in_status <= 1'b1;
                    alu_status <= 1'b1;
                    address_in <= in_counter;
                    cont_address <= cont_counter;
                    InReady <= 1'b1;
                    Start <= 1'b1;
                end
                WAIT_S2P: begin
                    InReady <= 1'b0;
                    Start <= 1'b0;
                end
                UPDATE_ADDR: begin
                    in_counter <= in_counter + 1;
                    cont_counter <= cont_counter + 1;
                end
                CHECK_FRAME: begin
                    if (Frame) begin
                        {rj_counter, coeff_counter, in_counter} <= 24'b0;
                    end
                end
                SLEEP: begin
                    {rj_status, coeff_status, in_status, alu_status} <= 4'b0000;
                    {InReady, Start, clear, set} <= 4'b0000;
                end
                RESUME: begin
                    // Resume from previous state
                end
                RESET: begin
                    {rj_counter, coeff_counter, in_counter, cont_counter} <= 34'b0;
                    {address_rj, address_coeff, address_in, cont_address} <= 34'b0;
                    {InReady, Start, clear, set} <= 4'b0000;
                    {rj_status, coeff_status, in_status, alu_status} <= 4'b0000;
                end
            endcase
        end
    end

    // Frame and S2P_status registers
    always @(posedge Dclk or negedge Reset_n) begin
        if (!Reset_n) begin
            frame_reg <= 1'b0;
            s2p_reg <= 1'b0;
        end else begin
            frame_reg <= Frame;
            s2p_reg <= S2P_status;
        end
    end

endmodule