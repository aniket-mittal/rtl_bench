module origen_146848 (
    input wire clk,
    input wire rst_n,
    
    // Input events
    input wire InjectorArmFinishMovement_eI,
    input wire EmergencyStopChanged_eI,
    input wire CanisterPressureChanged_eI,
    input wire FillContentsAvailableChanged_eI,
    input wire LasersChanged_eI,
    input wire DoorOverride_eI,
    input wire VacuumTimerElapsed_eI,
    
    // Input variables
    input wire EmergencyStop_I,
    input wire [7:0] CanisterPressure_I,
    input wire [7:0] FillContentsAvailable_I,
    input wire DoorSiteLaser_I,
    input wire InjectSiteLaser_I,
    input wire RejectSiteLaser_I,
    input wire RejectBinLaser_I,
    input wire AcceptBinLaser_I,
    
    // Output events
    output reg DoorReleaseCanister_eO,
    output reg ConveyorChanged_eO,
    output reg InjectorPositionChanged_eO,
    output reg InjectorControlsChanged_eO,
    output reg FillContentsChanged_eO,
    output reg StartVacuumTimer_eO,
    output reg GoRejectArm_eO,
    output reg CanisterCountChanged_eO,
    output reg InjectDone_eO,
    
    // Output variables
    output reg [7:0] ConveyorSpeed_O,
    output reg [7:0] InjectorPosition_O,
    output reg InjectorContentsValveOpen_O,
    output reg InjectorVacuumRun_O,
    output reg InjectorPressurePumpRun_O,
    output reg [7:0] FillContents_O,
    output reg [15:0] CanisterCount_O
);

    // State machine states
    localparam IDLE = 3'd0;
    localparam INJECT = 3'd1;
    localparam VACUUM = 3'd2;
    localparam FILL = 3'd3;
    localparam REJECT = 3'd4;
    localparam ACCEPT = 3'd5;

    reg [2:0] current_state, next_state;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            current_state <= IDLE;
        end else begin
            current_state <= next_state;
        end
    end

    always @(*) begin
        next_state = current_state;
        
        case (current_state)
            IDLE: begin
                if (InjectSiteLaser_I && !EmergencyStop_I) next_state = INJECT;
            end
            INJECT: begin
                if (InjectorArmFinishMovement_eI) next_state = VACUUM;
            end
            VACUUM: begin
                if (VacuumTimerElapsed_eI) next_state = FILL;
            end
            FILL: begin
                if (CanisterPressureChanged_eI && CanisterPressure_I >= 8'hC8) next_state = ACCEPT;
                else if (CanisterPressureChanged_eI && CanisterPressure_I < 8'hC8) next_state = REJECT;
            end
            REJECT: begin
                if (RejectBinLaser_I) next_state = IDLE;
            end
            ACCEPT: begin
                if (AcceptBinLaser_I) next_state = IDLE;
            end
        endcase

        if (EmergencyStop_I) next_state = IDLE;
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            DoorReleaseCanister_eO <= 0;
            ConveyorChanged_eO <= 0;
            InjectorPositionChanged_eO <= 0;
            InjectorControlsChanged_eO <= 0;
            FillContentsChanged_eO <= 0;
            StartVacuumTimer_eO <= 0;
            GoRejectArm_eO <= 0;
            CanisterCountChanged_eO <= 0;
            InjectDone_eO <= 0;
            ConveyorSpeed_O <= 0;
            InjectorPosition_O <= 0;
            InjectorContentsValveOpen_O <= 0;
            InjectorVacuumRun_O <= 0;
            InjectorPressurePumpRun_O <= 0;
            FillContents_O <= 0;
            CanisterCount_O <= 0;
        end else begin
            case (next_state)
                IDLE: begin
                    ConveyorChanged_eO <= 1;
                    ConveyorSpeed_O <= 8'h64; // Set conveyor speed to 100
                end
                INJECT: begin
                    InjectorPositionChanged_eO <= 1;
                    InjectorPosition_O <= 8'hFF; // Move injector to full extend
                end
                VACUUM: begin
                    StartVacuumTimer_eO <= 1;
                    InjectorControlsChanged_eO <= 1;
                    InjectorVacuumRun_O <= 1;
                end
                FILL: begin
                    InjectorControlsChanged_eO <= 1;
                    InjectorVacuumRun_O <= 0;
                    InjectorContentsValveOpen_O <= 1;
                    FillContentsChanged_eO <= 1;
                    FillContents_O <= FillContentsAvailable_I;
                end
                REJECT: begin
                    GoRejectArm_eO <= 1;
                    CanisterCountChanged_eO <= 1;
                    CanisterCount_O <= CanisterCount_O + 1;
                end
                ACCEPT: begin
                    InjectDone_eO <= 1;
                    CanisterCountChanged_eO <= 1;
                    CanisterCount_O <= CanisterCount_O + 1;
                end
            endcase

            if (EmergencyStop_I) begin
                DoorReleaseCanister_eO <= 1;
                ConveyorChanged_eO <= 1;
                ConveyorSpeed_O <= 0;
                InjectorControlsChanged_eO <= 1;
                InjectorContentsValveOpen_O <= 0;
                InjectorVacuumRun_O <= 0;
                InjectorPressurePumpRun_O <= 0;
            end
        end
    end

endmodule