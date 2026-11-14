// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 39;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08831 dut (
    .ACLK(clk),
    .ARESETN(in_vec[35:35]),
    .S_AXIS_TDATA(in_vec[34:3]),
    .S_AXIS_TLAST(in_vec[2:2]),
    .S_AXIS_TVALID(in_vec[1:1]),
    .M_AXIS_TREADY(in_vec[0:0]),
    .S_AXIS_TREADY(out_vec[38:38]),
    .M_AXIS_TVALID(out_vec[37:37]),
    .M_AXIS_TDATA(out_vec[36:5]),
    .M_AXIS_TLAST(out_vec[4:4]),
    .M_AXIS_TKEEP(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'h765d1a32e;
    stim[1] = 36'h4a0a3b58d;
    stim[2] = 36'he529997a2;
    stim[3] = 36'h8a9ebc4b0;
    stim[4] = 36'hb16a4202c;
    stim[5] = 36'hdeb7c93aa;
    stim[6] = 36'hcb536a657;
    stim[7] = 36'hc70c7f050;
    stim[8] = 36'ha3fa26c8c;
    stim[9] = 36'ha4155ccca;
    stim[10] = 36'hd57b30401;
    stim[11] = 36'hbdb52865f;
    stim[12] = 36'h14629882b;
    stim[13] = 36'hd918cb9be;
    stim[14] = 36'h8d7fb9965;
    stim[15] = 36'hd9719309c;
    stim[16] = 36'hb5891143e;
    stim[17] = 36'hd6966dd86;
    stim[18] = 36'ha6b3a320a;
    stim[19] = 36'heddf467c1;
    stim[20] = 36'hf751966d1;
    stim[21] = 36'h8afa5c447;
    stim[22] = 36'he1de66294;
    stim[23] = 36'hb41623ef8;
    stim[24] = 36'hef193dc17;
    stim[25] = 36'h9989c288a;
    stim[26] = 36'hd45d696bb;
    stim[27] = 36'h83f8fda77;
    stim[28] = 36'h8fc5630bb;
    stim[29] = 36'h9b598bfc1;
    stim[30] = 36'hda06d9bf7;
    stim[31] = 36'h9f5da6113;
    stim[32] = 36'hb1a061a51;
    stim[33] = 36'hbc1fedb67;
    stim[34] = 36'ha3c3e0fc3;
    stim[35] = 36'hbf33afaf6;
    stim[36] = 36'hd06f1b85a;
    stim[37] = 36'h9e61db508;
    stim[38] = 36'ha5a595555;
    stim[39] = 36'h946b55736;
    stim[40] = 36'he15d5805b;
    stim[41] = 36'hbaa1fb059;
    stim[42] = 36'hc291ae98c;
    stim[43] = 36'hee3c8d7e6;
    stim[44] = 36'hb01b0c84d;
    stim[45] = 36'hfec054f6f;
    stim[46] = 36'hec31a7201;
    stim[47] = 36'ha4df6b46e;
    stim[48] = 36'h9bbae2ac3;
    stim[49] = 36'hbf378a568;
    stim[50] = 36'h89b41c5ea;
    stim[51] = 36'hd3d045524;
    stim[52] = 36'h87dafcd6e;
    stim[53] = 36'hafd0d8615;
    stim[54] = 36'hb1f5a4871;
    stim[55] = 36'hedfd380b0;
    stim[56] = 36'h8690eeeae;
    stim[57] = 36'hdb220fab6;
    stim[58] = 36'hc99c44517;
    stim[59] = 36'hc821e117c;
    stim[60] = 36'h801055fa6;
    stim[61] = 36'ha0677f9ee;
    stim[62] = 36'h8f9ff9f61;
    stim[63] = 36'hf74e092cf;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 39'hxxxxxxxxxf;
      expv[1] = 39'h000000000f;
      expv[2] = 39'h000000000f;
      expv[3] = 39'h400000000f;
      expv[4] = 39'h400000000f;
      expv[5] = 39'h400000000f;
      expv[6] = 39'h57adf24eaf;
      expv[7] = 39'h4a82cce7ef;
      expv[8] = 39'h4a82cce7ef;
      expv[9] = 39'h4a82cce7ef;
      expv[10] = 39'h5388241b0f;
      expv[11] = 39'h5388241b0f;
      expv[12] = 39'h42f56e346f;
      expv[13] = 39'h000000000f;
      expv[14] = 39'h400000000f;
      expv[15] = 39'h400000000f;
      expv[16] = 39'h400000000f;
      expv[17] = 39'h4d624450ef;
      expv[18] = 39'h4307dfc6ef;
      expv[19] = 39'h4cb4c88f0f;
      expv[20] = 39'h4cb4c88f0f;
      expv[21] = 39'h4cb4c88f0f;
      expv[22] = 39'h4f735fa00f;
      expv[23] = 39'h4f735fa00f;
      expv[24] = 39'h4f735fa00f;
      expv[25] = 39'h4b39af104f;
      expv[26] = 39'h519c1fb26f;
      expv[27] = 39'h46b37a0d4f;
      expv[28] = 39'h27b1b9770f;
      expv[29] = 39'h27b1b9770f;
      expv[30] = 39'h27b1b9770f;
      expv[31] = 39'h27b1b9770f;
      expv[32] = 39'h27b1b9770f;
      expv[33] = 39'h27b1b9770f;
      expv[34] = 39'h27b1b9770f;
      expv[35] = 39'h27b1b9770f;
      expv[36] = 39'h27b1b9770f;
      expv[37] = 39'h27b1b9770f;
      expv[38] = 39'h27b1b9770f;
      expv[39] = 39'h07b1b9770f;
      expv[40] = 39'h400000000f;
      expv[41] = 39'h585756016f;
      expv[42] = 39'h585756016f;
      expv[43] = 39'h585756016f;
      expv[44] = 39'h53e67960ef;
      expv[45] = 39'h53e67960ef;
      expv[46] = 39'h53968e9e8f;
      expv[47] = 39'h53968e9e8f;
      expv[48] = 39'h5cce69702f;
      expv[49] = 39'h43bd221b2f;
      expv[50] = 39'h43bd221b2f;
      expv[51] = 39'h462a2932cf;
      expv[52] = 39'h462a2932cf;
      expv[53] = 39'h4820e8686f;
      expv[54] = 39'h4820e8686f;
      expv[55] = 39'h4820e8686f;
      expv[56] = 39'h4820e8686f;
      expv[57] = 39'h29c524230f;
      expv[58] = 39'h29c524230f;
      expv[59] = 39'h29c524230f;
      expv[60] = 39'h29c524230f;
      expv[61] = 39'h29c524230f;
      expv[62] = 39'h29c524230f;
      expv[63] = 39'h29c524230f;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
