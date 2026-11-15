// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_202344 dut (
    .clk(clk),
    .rst(in_vec[65:65]),
    .enable(in_vec[64:64]),
    .A(in_vec[63:32]),
    .B(in_vec[31:0]),
    .result(out_vec[32:1]),
    .valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h3ba42f23b9b79b86c;
    stim[1] = 66'h3d00060e1c03ce49e;
    stim[2] = 66'h1cd9efcd07e9af459;
    stim[3] = 66'h0fda7ebae4ac9a991;
    stim[4] = 66'h0a3f804b88020e1c4;
    stim[5] = 66'h1c20e2bc8763bc801;
    stim[6] = 66'h0397ffd0bcc55fd70;
    stim[7] = 66'h0e271c4edc475a689;
    stim[8] = 66'h1c441c42e6c83ccba;
    stim[9] = 66'h0c5bb8be46b3a37b7;
    stim[10] = 66'h03c996db76bc41bb2;
    stim[11] = 66'h1c06f25d36419dd07;
    stim[12] = 66'h19ebf97e17f73e6cb;
    stim[13] = 66'h06829ae6522138fce;
    stim[14] = 66'h024c28ff55ec9868b;
    stim[15] = 66'h04fa8c6616d86eed8;
    stim[16] = 66'h08409cab4fc18f8b3;
    stim[17] = 66'h122ac5ebea5688ed1;
    stim[18] = 66'h03a02f4ca44cde6f8;
    stim[19] = 66'h1d5d0da654c2c7d8f;
    stim[20] = 66'h1b45dc1ba40f5645d;
    stim[21] = 66'h0337092713c26c76c;
    stim[22] = 66'h137eaf2b1022f077a;
    stim[23] = 66'h134e169caa298a1c1;
    stim[24] = 66'h1b0daa97b7135e261;
    stim[25] = 66'h07765b24691ddf669;
    stim[26] = 66'h03a31f44e466262f3;
    stim[27] = 66'h17fde87c11c2ce6bd;
    stim[28] = 66'h1276d0748100d9458;
    stim[29] = 66'h18c7002791bd5a22b;
    stim[30] = 66'h0df3abbf0741860fc;
    stim[31] = 66'h082e5fbd9773a4922;
    stim[32] = 66'h0af75d542f3d08509;
    stim[33] = 66'h06c0c418ce32b24d4;
    stim[34] = 66'h1405ae35d8bad72f8;
    stim[35] = 66'h0519177c8d3237b1e;
    stim[36] = 66'h136699d44226df10d;
    stim[37] = 66'h0870e285c70f23d33;
    stim[38] = 66'h1b605e7616b2c3702;
    stim[39] = 66'h1bb9c939c2c064781;
    stim[40] = 66'h0b3cbefc29ad02aa5;
    stim[41] = 66'h12d5818f358e2a3ff;
    stim[42] = 66'h12565b975569c0577;
    stim[43] = 66'h066000077785fcdf8;
    stim[44] = 66'h0cf592187b669c0be;
    stim[45] = 66'h10d088684c5ed1128;
    stim[46] = 66'h1e4fb56af8d5557a1;
    stim[47] = 66'h113e08db30c13058d;
    stim[48] = 66'h004db43313a2f291d;
    stim[49] = 66'h06bd73e8fd8b9877d;
    stim[50] = 66'h07b8dc61d27e3695c;
    stim[51] = 66'h0009517ef869e9087;
    stim[52] = 66'h089c45fcd973c8f56;
    stim[53] = 66'h0f544b09933dd9e96;
    stim[54] = 66'h0d16052a81784d3ba;
    stim[55] = 66'h00d95599e304e2d91;
    stim[56] = 66'h180c9f72576020b75;
    stim[57] = 66'h173ab6012aee448ca;
    stim[58] = 66'h0f29a8d14675c9e8c;
    stim[59] = 66'h05bc2f2fce44c76b8;
    stim[60] = 66'h15492907ddadc12d9;
    stim[61] = 66'h0f683b838c1d5641a;
    stim[62] = 66'h1f2e8fb9c522ebf73;
    stim[63] = 66'h1d644e988e5526fc3;
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
      expv[0] = 33'hxxxxxxxxx;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h032000001;
      expv[4] = 33'h032000000;
      expv[5] = 33'h032000000;
      expv[6] = 33'h1e20001a1;
      expv[7] = 33'h1e20001a0;
      expv[8] = 33'h1e20001a0;
      expv[9] = 33'h1c4001a79;
      expv[10] = 33'h1c4001a78;
      expv[11] = 33'h1c4001a78;
      expv[12] = 33'h1920007cf;
      expv[13] = 33'h178001675;
      expv[14] = 33'h178001674;
      expv[15] = 33'h178001674;
      expv[16] = 33'h178001674;
      expv[17] = 33'h178001674;
      expv[18] = 33'h020039951;
      expv[19] = 33'h020039950;
      expv[20] = 33'h1880487cf;
      expv[21] = 33'h0d403834d;
      expv[22] = 33'h0d403834c;
      expv[23] = 33'h1e8055fc9;
      expv[24] = 33'h05e09d2d7;
      expv[25] = 33'h1880257dd;
      expv[26] = 33'h1880257dc;
      expv[27] = 33'h1880257dc;
      expv[28] = 33'h1700262a9;
      expv[29] = 33'h1de042523;
      expv[30] = 33'h1a0017223;
      expv[31] = 33'h1a0017222;
      expv[32] = 33'h1a0017222;
      expv[33] = 33'h1a0017222;
      expv[34] = 33'h1a0017222;
      expv[35] = 33'h03002577d;
      expv[36] = 33'h03002577c;
      expv[37] = 33'h062081165;
      expv[38] = 33'h062081164;
      expv[39] = 33'h1860b56db;
      expv[40] = 33'h0a0008285;
      expv[41] = 33'h0a0008284;
      expv[42] = 33'h1180002cd;
      expv[43] = 33'h0f00043e3;
      expv[44] = 33'h0f00043e2;
      expv[45] = 33'h0f00043e2;
      expv[46] = 33'h04c05913b;
      expv[47] = 33'h0c800743b;
      expv[48] = 33'h1800148f1;
      expv[49] = 33'h1800148f0;
      expv[50] = 33'h1800148f0;
      expv[51] = 33'h1800148f0;
      expv[52] = 33'h1800148f0;
      expv[53] = 33'h1800148f0;
      expv[54] = 33'h1800148f0;
      expv[55] = 33'h1800148f0;
      expv[56] = 33'h1800148f0;
      expv[57] = 33'h0dc03964f;
      expv[58] = 33'h18a000973;
      expv[59] = 33'h18a000972;
      expv[60] = 33'h18a000972;
      expv[61] = 33'h1be0021fb;
      expv[62] = 33'h1be0021fa;
      expv[63] = 33'h01401ab53;
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
