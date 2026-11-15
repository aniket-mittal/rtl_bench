module origen_024102 (
    input wire CLK,
    input wire RST_N,
    input wire START,
    input wire STOP,
    input wire FRAME,
    output reg STARTED,
    output reg STOPPED,
    output reg [1:0] STATE,
    output reg FETCH_EN,
    output reg LCD_ENABLE,
    output reg SYNC_ENABLE,
    output reg BL_ENABLE
);

    // Main states
    localparam [1:0] STOPPED_STATE  = 2'b00;
    localparam [1:0] STARTING_STATE = 2'b01;
    localparam [1:0] STARTED_STATE  = 2'b10;
    localparam [1:0] STOPPING_STATE = 2'b11;

    // Internal states
    localparam [2:0] IDLE             = 3'd0;
    localparam [2:0] LCD_POWERUP1     = 3'd1;
    localparam [2:0] LCD_POWERUP2     = 3'd2;
    localparam [2:0] RUNNING          = 3'd3;
    localparam [2:0] LCD_POWERDOWN1   = 3'd4;
    localparam [2:0] LCD_POWERDOWN2   = 3'd5;
    localparam [2:0] FIFO_RUNDOWN     = 3'd6;

    reg [2:0] internal_state, next_internal_state;
    reg [1:0] frame_count;

    always @(posedge CLK or negedge RST_N) begin
        if (!RST_N) begin
            internal_state <= IDLE;
            STATE <= STOPPED_STATE;
            frame_count <= 2'b00;
            FETCH_EN <= 1'b0;
            LCD_ENABLE <= 1'b0;
            SYNC_ENABLE <= 1'b0;
            BL_ENABLE <= 1'b0;
            STARTED <= 1'b0;
            STOPPED <= 1'b0;
        end else begin
            internal_state <= next_internal_state;
            
            case (internal_state)
                IDLE: begin
                    STATE <= STOPPED_STATE;
                    FETCH_EN <= 1'b0;
                    LCD_ENABLE <= 1'b0;
                    SYNC_ENABLE <= 1'b0;
                    BL_ENABLE <= 1'b0;
                    STARTED <= 1'b0;
                    STOPPED <= 1'b0;
                end
                
                LCD_POWERUP1: begin
                    STATE <= STARTING_STATE;
                    FETCH_EN <= 1'b1;
                    LCD_ENABLE <= 1'b1;
                    SYNC_ENABLE <= 1'b1;
                    if (FRAME) frame_count <= frame_count + 1'b1;
                end
                
                LCD_POWERUP2: begin
                    STATE <= STARTING_STATE;
                    if (FRAME) begin
                        frame_count <= 2'b00;
                        BL_ENABLE <= 1'b1;
                    end
                end
                
                RUNNING: begin
                    STATE <= STARTED_STATE;
                    STARTED <= 1'b1;
                end
                
                LCD_POWERDOWN1: begin
                    STATE <= STOPPING_STATE;
                    BL_ENABLE <= 1'b0;
                    if (FRAME) frame_count <= frame_count + 1'b1;
                end
                
                LCD_POWERDOWN2: begin
                    STATE <= STOPPING_STATE;
                    if (FRAME) frame_count <= 2'b00;
                end
                
                FIFO_RUNDOWN: begin
                    STATE <= STOPPING_STATE;
                    FETCH_EN <= 1'b0;
                    LCD_ENABLE <= 1'b0;
                    SYNC_ENABLE <= 1'b0;
                end
            endcase
        end
    end

    always @(*) begin
        next_internal_state = internal_state;
        
        case (internal_state)
            IDLE:
                if (START) next_internal_state = LCD_POWERUP1;
            
            LCD_POWERUP1:
                if (frame_count == 2'b01) next_internal_state = LCD_POWERUP2;
            
            LCD_POWERUP2:
                if (frame_count == 2'b00 && BL_ENABLE) next_internal_state = RUNNING;
            
            RUNNING:
                if (STOP) next_internal_state = LCD_POWERDOWN1;
            
            LCD_POWERDOWN1:
                if (frame_count == 2'b01) next_internal_state = LCD_POWERDOWN2;
            
            LCD_POWERDOWN2:
                if (frame_count == 2'b00) next_internal_state = FIFO_RUNDOWN;
            
            FIFO_RUNDOWN:
                next_internal_state = IDLE;
        endcase
    end

endmodule