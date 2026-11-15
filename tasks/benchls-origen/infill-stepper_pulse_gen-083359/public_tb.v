// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_083359 dut (
    .clk(clk),
    .rst(in_vec[67:67]),
    .drv_dir(in_vec[66:66]),
    .enable(in_vec[65:65]),
    .counter_en(in_vec[64:64]),
    .drv_period(in_vec[63:32]),
    .PULSE_NUMBER(in_vec[31:0]),
    .drv_pulse(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'ha325a3ca7f105d5b6;
    stim[1] = 68'hd32dc1262ca9e71b7;
    stim[2] = 68'h1f978af692efa1378;
    stim[3] = 68'h419d593611d7ea398;
    stim[4] = 68'h5e3bbc59a12050203;
    stim[5] = 68'h449d2a75ccba38c90;
    stim[6] = 68'h4acf3eb2c78af0c41;
    stim[7] = 68'h01bb8e06a53c155aa;
    stim[8] = 68'h5ce2d08ab69b9bacf;
    stim[9] = 68'h3551ce0df64e90778;
    stim[10] = 68'h70d769814d146ffb4;
    stim[11] = 68'h212b90c4bf1e8408f;
    stim[12] = 68'h42e671775b3cd1676;
    stim[13] = 68'h0a1a9202eb933bfd0;
    stim[14] = 68'h1a53fff4b1798656c;
    stim[15] = 68'h4f7ffb3c5a4d60630;
    stim[16] = 68'h15d30aa2788486ae2;
    stim[17] = 68'h5698200466b090db7;
    stim[18] = 68'h7d3f8859e32d32413;
    stim[19] = 68'h7c78e29da7e943bd6;
    stim[20] = 68'h04cbc50ca0986d8f0;
    stim[21] = 68'h7be46f285b83f3317;
    stim[22] = 68'h38e1382e4f90b51f1;
    stim[23] = 68'h61526686e23ce9727;
    stim[24] = 68'h14d052bee20e88de9;
    stim[25] = 68'h0804ec4d118e5adcf;
    stim[26] = 68'h017dca150ae0be99a;
    stim[27] = 68'h4069718c6d7851ce6;
    stim[28] = 68'h6dfea09728a71aeb0;
    stim[29] = 68'h280231056cccd6c66;
    stim[30] = 68'h356b12ca2748a6fda;
    stim[31] = 68'h0d1892513e9992456;
    stim[32] = 68'h6e5da9a8ef866b346;
    stim[33] = 68'h671a570ea0b7123f7;
    stim[34] = 68'h292703f45a1cdaed3;
    stim[35] = 68'h6ac1d24024e658038;
    stim[36] = 68'h6a2d18d153a2b6d66;
    stim[37] = 68'h76db8a331f147b497;
    stim[38] = 68'h7897fbefe64dbea60;
    stim[39] = 68'h638b6775ffe3f1d3f;
    stim[40] = 68'h794fd2628f3bf65ea;
    stim[41] = 68'h17c51d144607c34e1;
    stim[42] = 68'h0d26511a21d6dc256;
    stim[43] = 68'h34f7c4b123a6eaefb;
    stim[44] = 68'h6332b092223dbd0b4;
    stim[45] = 68'h79831dea37fedb62b;
    stim[46] = 68'h43c2efc32d6117ae7;
    stim[47] = 68'h495a1c8e70a165416;
    stim[48] = 68'h1a226649afe124e59;
    stim[49] = 68'h1f0e8b3f7839d78b0;
    stim[50] = 68'h430bd9c383b0c8d5e;
    stim[51] = 68'h34dad037c044288bf;
    stim[52] = 68'h481dd5aa58021c633;
    stim[53] = 68'h6ef406614cd4cf054;
    stim[54] = 68'h73811bbc036503509;
    stim[55] = 68'h3f834b6d920e89bfe;
    stim[56] = 68'h3de8e25865a8e9e67;
    stim[57] = 68'h6ac7422e8271a9c3b;
    stim[58] = 68'h46e83766b483cff00;
    stim[59] = 68'hc3320b833d6f70914;
    stim[60] = 68'h3abf2ed1e1a56dfeb;
    stim[61] = 68'h2b2a52c0a8faafe7e;
    stim[62] = 68'h1ecd895ecde841401;
    stim[63] = 68'h641d5e22db8d82b2f;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'hxxxxxxxx;
      expv[2] = 32'hxxxxxxxx;
      expv[3] = 32'hxxxxxxxx;
      expv[4] = 32'hxxxxxxxx;
      expv[5] = 32'hxxxxxxxx;
      expv[6] = 32'hxxxxxxxx;
      expv[7] = 32'hxxxxxxxx;
      expv[8] = 32'hxxxxxxxx;
      expv[9] = 32'hxxxxxxxx;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'h0000ffff;
      expv[13] = 32'h0000ffff;
      expv[14] = 32'h0000ffff;
      expv[15] = 32'h0000ffff;
      expv[16] = 32'h0000ffff;
      expv[17] = 32'h0000ffff;
      expv[18] = 32'h0000ffff;
      expv[19] = 32'h00000000;
      expv[20] = 32'h00000000;
      expv[21] = 32'h00000000;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h0000ffff;
      expv[25] = 32'h0000ffff;
      expv[26] = 32'h0000ffff;
      expv[27] = 32'h0000ffff;
      expv[28] = 32'h0000ffff;
      expv[29] = 32'h00000000;
      expv[30] = 32'h00000000;
      expv[31] = 32'h0000ffff;
      expv[32] = 32'h0000ffff;
      expv[33] = 32'h00000000;
      expv[34] = 32'h00000000;
      expv[35] = 32'h0000ffff;
      expv[36] = 32'h0000ffff;
      expv[37] = 32'h0000ffff;
      expv[38] = 32'h0000ffff;
      expv[39] = 32'h0000ffff;
      expv[40] = 32'h0000ffff;
      expv[41] = 32'h0000ffff;
      expv[42] = 32'h0000ffff;
      expv[43] = 32'h0000ffff;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000000;
      expv[46] = 32'h0000ffff;
      expv[47] = 32'h0000ffff;
      expv[48] = 32'h0000ffff;
      expv[49] = 32'h0000ffff;
      expv[50] = 32'h0000ffff;
      expv[51] = 32'h0000ffff;
      expv[52] = 32'h00000000;
      expv[53] = 32'h00000000;
      expv[54] = 32'h00000000;
      expv[55] = 32'h00000000;
      expv[56] = 32'h0000ffff;
      expv[57] = 32'h0000ffff;
      expv[58] = 32'h0000ffff;
      expv[59] = 32'h0000ffff;
      expv[60] = 32'h0000ffff;
      expv[61] = 32'h00000000;
      expv[62] = 32'h00000000;
      expv[63] = 32'h00000000;
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
