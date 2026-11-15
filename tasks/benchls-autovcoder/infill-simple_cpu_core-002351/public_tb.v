// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 74;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_002351 dut (
    .clk(clk),
    .rst(in_vec[32:32]),
    .bus_in(in_vec[31:0]),
    .bus_A(out_vec[73:42]),
    .bus_out(out_vec[41:10]),
    .bus_WE(out_vec[9:9]),
    .bus_RE(out_vec[8:8]),
    .current_opcode(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h10f153dd6;
    stim[1] = 33'h1fbddde7f;
    stim[2] = 33'h093c44046;
    stim[3] = 33'h003f3683f;
    stim[4] = 33'h0d77a17e2;
    stim[5] = 33'h0ffa8b79c;
    stim[6] = 33'h01df5a063;
    stim[7] = 33'h13f384389;
    stim[8] = 33'h0a29f36d6;
    stim[9] = 33'h0161c81c8;
    stim[10] = 33'h0dad9f152;
    stim[11] = 33'h0007884c2;
    stim[12] = 33'h0c9d816a5;
    stim[13] = 33'h06384f28b;
    stim[14] = 33'h09167d600;
    stim[15] = 33'h0cdb6e78b;
    stim[16] = 33'h0323546ed;
    stim[17] = 33'h09f4463f5;
    stim[18] = 33'h10d2947a5;
    stim[19] = 33'h076e090f2;
    stim[20] = 33'h0dac888df;
    stim[21] = 33'h0ca760eb5;
    stim[22] = 33'h0d7c4fe65;
    stim[23] = 33'h01d726f82;
    stim[24] = 33'h0fa568a39;
    stim[25] = 33'h07869ad8e;
    stim[26] = 33'h05192dce8;
    stim[27] = 33'h07c37e428;
    stim[28] = 33'h03890868e;
    stim[29] = 33'h00d557c02;
    stim[30] = 33'h03334be9f;
    stim[31] = 33'h0e6598065;
    stim[32] = 33'h06e0dcd5b;
    stim[33] = 33'h0fbc73ef6;
    stim[34] = 33'h0f7dbad0d;
    stim[35] = 33'h044c4201d;
    stim[36] = 33'h078901a1c;
    stim[37] = 33'h0aea54483;
    stim[38] = 33'h0af7945a3;
    stim[39] = 33'h0ddfb742c;
    stim[40] = 33'h076c6748f;
    stim[41] = 33'h0a7140e86;
    stim[42] = 33'h01530d1e8;
    stim[43] = 33'h0837f794e;
    stim[44] = 33'h0ca0b3590;
    stim[45] = 33'h02a0f0043;
    stim[46] = 33'h05a6143c5;
    stim[47] = 33'h04b356195;
    stim[48] = 33'h008319292;
    stim[49] = 33'h01bfda174;
    stim[50] = 33'h0279c9ee6;
    stim[51] = 33'h1e87ac417;
    stim[52] = 33'h0c03070cf;
    stim[53] = 33'h0bcaf300d;
    stim[54] = 33'h0c69758e9;
    stim[55] = 33'h07d54fce3;
    stim[56] = 33'h0794faf86;
    stim[57] = 33'h00747498c;
    stim[58] = 33'h0573e0ddc;
    stim[59] = 33'h032bb650f;
    stim[60] = 33'h0119b57de;
    stim[61] = 33'h0ff2a9477;
    stim[62] = 33'h0f44df766;
    stim[63] = 33'h0a07daa54;
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
      expv[0] = 74'hxxxxxxxxxxxxxxxxxxx;
      expv[1] = 74'h00000000xxxxxxxxxxx;
      expv[2] = 74'h00000000xxxxxxxxx7f;
      expv[3] = 74'h00000000xxxxxxxxx46;
      expv[4] = 74'h00000000xxxxxxxxx46;
      expv[5] = 74'h3ffffff100000000046;
      expv[6] = 74'h0000000000000000046;
      expv[7] = 74'h0000000040000000146;
      expv[8] = 74'h0000000000000000189;
      expv[9] = 74'h00000000000000000d6;
      expv[10] = 74'h00000000000000000d6;
      expv[11] = 74'h3fffffe7c00000000d6;
      expv[12] = 74'h00000000000000000d6;
      expv[13] = 74'h00000000400000001d6;
      expv[14] = 74'h000000000000000008b;
      expv[15] = 74'h000000000000000008b;
      expv[16] = 74'h3fffffe10000000008b;
      expv[17] = 74'h000000000000000008b;
      expv[18] = 74'h000000008000000018b;
      expv[19] = 74'h00000000000000001a5;
      expv[20] = 74'h00000000000000000f2;
      expv[21] = 74'h00000000000000000f2;
      expv[22] = 74'h3ffffff8000000000f2;
      expv[23] = 74'h00000000000000000f2;
      expv[24] = 74'h00000000400000001f2;
      expv[25] = 74'h0000000000000000039;
      expv[26] = 74'h0000000000000000039;
      expv[27] = 74'h0000001580000000039;
      expv[28] = 74'h0000000000000000039;
      expv[29] = 74'h0000000080000000139;
      expv[30] = 74'h0000000000000000002;
      expv[31] = 74'h0000000000000000002;
      expv[32] = 74'h0000001540000000002;
      expv[33] = 74'h0000000000000000002;
      expv[34] = 74'h00000000c0000000102;
      expv[35] = 74'h000000000000000000d;
      expv[36] = 74'h000000000000000000d;
      expv[37] = 74'h3ffffff6c000000000d;
      expv[38] = 74'h000000000000000000d;
      expv[39] = 74'h000000010000000010d;
      expv[40] = 74'h000000000000000002c;
      expv[41] = 74'h000000000000000002c;
      expv[42] = 74'h3ffffffec000000002c;
      expv[43] = 74'h000000000000000002c;
      expv[44] = 74'h000000014000000012c;
      expv[45] = 74'h0000000000000000090;
      expv[46] = 74'h0000000000000000090;
      expv[47] = 74'h00000002c0000000090;
      expv[48] = 74'h0000000000000000090;
      expv[49] = 74'h0000000180000000190;
      expv[50] = 74'h0000000000000000074;
      expv[51] = 74'h0000000000000000074;
      expv[52] = 74'h0000000000000000174;
      expv[53] = 74'h00000000000000000cf;
      expv[54] = 74'h00000000000000000cf;
      expv[55] = 74'h0000000c000000000cf;
      expv[56] = 74'h00000000000000000cf;
      expv[57] = 74'h00000000400000001cf;
      expv[58] = 74'h000000000000000008c;
      expv[59] = 74'h000000000000000008c;
      expv[60] = 74'h00000011c000000008c;
      expv[61] = 74'h000000000000000008c;
      expv[62] = 74'h000000008000000018c;
      expv[63] = 74'h0000000000000000066;
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
