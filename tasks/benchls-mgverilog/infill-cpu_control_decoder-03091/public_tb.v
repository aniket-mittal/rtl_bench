// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03091 dut (
    .instr(in_vec[31:16]),
    .psr(in_vec[15:0]),
    .ext_signed(out_vec[9:9]),
    .bSelect(out_vec[8:8]),
    .shftSelect(out_vec[7:7]),
    .aluSelect(out_vec[6:6]),
    .wregSelect(out_vec[5:4]),
    .jmp(out_vec[3:3]),
    .branch(out_vec[2:2]),
    .rwren(out_vec[1:1]),
    .dwren(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h3d5127c0;
    stim[1] = 32'h69d2078a;
    stim[2] = 32'h9934262f;
    stim[3] = 32'h80e4d642;
    stim[4] = 32'h00dfd3a6;
    stim[5] = 32'h41a7b05c;
    stim[6] = 32'h92304408;
    stim[7] = 32'h84ef7e52;
    stim[8] = 32'h74eb7a1b;
    stim[9] = 32'h7bcf2b48;
    stim[10] = 32'h6ac1a8f9;
    stim[11] = 32'h4048d230;
    stim[12] = 32'h1509c149;
    stim[13] = 32'h28b3e15a;
    stim[14] = 32'hbe5958aa;
    stim[15] = 32'h4d58ef7c;
    stim[16] = 32'h7884e509;
    stim[17] = 32'h1458c368;
    stim[18] = 32'h740726a9;
    stim[19] = 32'h6c1cb119;
    stim[20] = 32'headd45ea;
    stim[21] = 32'h95efe3cd;
    stim[22] = 32'hd96cdda1;
    stim[23] = 32'he0d704b4;
    stim[24] = 32'hbfdda066;
    stim[25] = 32'h17650fda;
    stim[26] = 32'h4b351e58;
    stim[27] = 32'h176630bc;
    stim[28] = 32'h91a2f885;
    stim[29] = 32'h05409761;
    stim[30] = 32'hceaa3232;
    stim[31] = 32'h553a532b;
    stim[32] = 32'h50234730;
    stim[33] = 32'h42685a78;
    stim[34] = 32'h6760f923;
    stim[35] = 32'h87b01f31;
    stim[36] = 32'h8573eedb;
    stim[37] = 32'h5fd24f83;
    stim[38] = 32'hf720ff53;
    stim[39] = 32'h4eb99a1d;
    stim[40] = 32'h93c29046;
    stim[41] = 32'h90f5097d;
    stim[42] = 32'h448f881b;
    stim[43] = 32'hc70bc610;
    stim[44] = 32'hac081adc;
    stim[45] = 32'h641fda7a;
    stim[46] = 32'h2dd38b0b;
    stim[47] = 32'h5f0ec65e;
    stim[48] = 32'h7f6d9e51;
    stim[49] = 32'h3d13e6e7;
    stim[50] = 32'h5c9682ca;
    stim[51] = 32'h34af3181;
    stim[52] = 32'ha446f10d;
    stim[53] = 32'hd9e05f1d;
    stim[54] = 32'h77f9c4af;
    stim[55] = 32'h4a818485;
    stim[56] = 32'hfb73a137;
    stim[57] = 32'h35ff4f59;
    stim[58] = 32'hd293de79;
    stim[59] = 32'h535bf9cc;
    stim[60] = 32'h44bc1409;
    stim[61] = 32'hd45e52a9;
    stim[62] = 32'h7d87bdcf;
    stim[63] = 32'ha90b5ff1;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 10'h062;
      expv[1] = 10'h000;
      expv[2] = 10'h262;
      expv[3] = 10'h032;
      expv[4] = 10'h122;
      expv[5] = 10'h01a;
      expv[6] = 10'h262;
      expv[7] = 10'h032;
      expv[8] = 10'h000;
      expv[9] = 10'h000;
      expv[10] = 10'h000;
      expv[11] = 10'h001;
      expv[12] = 10'h062;
      expv[13] = 10'h062;
      expv[14] = 10'h262;
      expv[15] = 10'h001;
      expv[16] = 10'h000;
      expv[17] = 10'h062;
      expv[18] = 10'h000;
      expv[19] = 10'h000;
      expv[20] = 10'h000;
      expv[21] = 10'h262;
      expv[22] = 10'h062;
      expv[23] = 10'h000;
      expv[24] = 10'h262;
      expv[25] = 10'h062;
      expv[26] = 10'h002;
      expv[27] = 10'h062;
      expv[28] = 10'h262;
      expv[29] = 10'h122;
      expv[30] = 10'h004;
      expv[31] = 10'h262;
      expv[32] = 10'h262;
      expv[33] = 10'h001;
      expv[34] = 10'h000;
      expv[35] = 10'h0b2;
      expv[36] = 10'h032;
      expv[37] = 10'h262;
      expv[38] = 10'h062;
      expv[39] = 10'h01a;
      expv[40] = 10'h262;
      expv[41] = 10'h262;
      expv[42] = 10'h01a;
      expv[43] = 10'h004;
      expv[44] = 10'h000;
      expv[45] = 10'h000;
      expv[46] = 10'h062;
      expv[47] = 10'h262;
      expv[48] = 10'h000;
      expv[49] = 10'h062;
      expv[50] = 10'h262;
      expv[51] = 10'h062;
      expv[52] = 10'h000;
      expv[53] = 10'h062;
      expv[54] = 10'h000;
      expv[55] = 10'h01a;
      expv[56] = 10'h062;
      expv[57] = 10'h062;
      expv[58] = 10'h062;
      expv[59] = 10'h262;
      expv[60] = 10'h01a;
      expv[61] = 10'h062;
      expv[62] = 10'h000;
      expv[63] = 10'h000;
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
