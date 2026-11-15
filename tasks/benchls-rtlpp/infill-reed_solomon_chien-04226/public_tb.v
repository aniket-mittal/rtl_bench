// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04226 dut (
    .clk(clk),
    .DIN(in_vec[23:0]),
    .DOUT(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'hf14c81;
    stim[1] = 24'h80fdc5;
    stim[2] = 24'h4ad896;
    stim[3] = 24'h901257;
    stim[4] = 24'hd4c674;
    stim[5] = 24'h3622be;
    stim[6] = 24'hd44910;
    stim[7] = 24'h20c54b;
    stim[8] = 24'h7e6fbb;
    stim[9] = 24'h626aba;
    stim[10] = 24'h0f9749;
    stim[11] = 24'h04ce44;
    stim[12] = 24'h9e2547;
    stim[13] = 24'hb37247;
    stim[14] = 24'ha10c00;
    stim[15] = 24'h4b1d64;
    stim[16] = 24'hf65ac3;
    stim[17] = 24'hd39fa4;
    stim[18] = 24'hdc11c6;
    stim[19] = 24'h869123;
    stim[20] = 24'hd30841;
    stim[21] = 24'h04caf1;
    stim[22] = 24'h2c74e0;
    stim[23] = 24'h43133a;
    stim[24] = 24'h7095f9;
    stim[25] = 24'h37346b;
    stim[26] = 24'h57aedd;
    stim[27] = 24'h8df18f;
    stim[28] = 24'h7f15ef;
    stim[29] = 24'hb6cffb;
    stim[30] = 24'h91c2d7;
    stim[31] = 24'hed4438;
    stim[32] = 24'h5d7af1;
    stim[33] = 24'h39d354;
    stim[34] = 24'hf2ed0f;
    stim[35] = 24'h988e62;
    stim[36] = 24'h3ccee0;
    stim[37] = 24'haed7c8;
    stim[38] = 24'hac7368;
    stim[39] = 24'he30118;
    stim[40] = 24'h285783;
    stim[41] = 24'he4b08e;
    stim[42] = 24'hee31ff;
    stim[43] = 24'hd05a45;
    stim[44] = 24'h78f014;
    stim[45] = 24'h0289d2;
    stim[46] = 24'h21456a;
    stim[47] = 24'hbdf451;
    stim[48] = 24'h1764fd;
    stim[49] = 24'h5d6cc0;
    stim[50] = 24'hb1ec14;
    stim[51] = 24'hcfc936;
    stim[52] = 24'hbf2c7f;
    stim[53] = 24'h92fd4c;
    stim[54] = 24'h0b71b9;
    stim[55] = 24'h08cdce;
    stim[56] = 24'h2a061f;
    stim[57] = 24'h47c265;
    stim[58] = 24'h7c54ad;
    stim[59] = 24'hab7783;
    stim[60] = 24'hc54745;
    stim[61] = 24'h157150;
    stim[62] = 24'h6be934;
    stim[63] = 24'h1a049e;
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
      expv[0] = 8'hxx;
      expv[1] = 8'hxx;
      expv[2] = 8'hxx;
      expv[3] = 8'hfe;
      expv[4] = 8'hf0;
      expv[5] = 8'he3;
      expv[6] = 8'hf3;
      expv[7] = 8'hfc;
      expv[8] = 8'hdc;
      expv[9] = 8'hfc;
      expv[10] = 8'hd0;
      expv[11] = 8'hef;
      expv[12] = 8'hea;
      expv[13] = 8'hbf;
      expv[14] = 8'ha4;
      expv[15] = 8'hf5;
      expv[16] = 8'hf7;
      expv[17] = 8'hf5;
      expv[18] = 8'he3;
      expv[19] = 8'hff;
      expv[20] = 8'hfb;
      expv[21] = 8'hfd;
      expv[22] = 8'hf1;
      expv[23] = 8'hfb;
      expv[24] = 8'ha4;
      expv[25] = 8'hd7;
      expv[26] = 8'he1;
      expv[27] = 8'hed;
      expv[28] = 8'hdd;
      expv[29] = 8'he7;
      expv[30] = 8'hf2;
      expv[31] = 8'hef;
      expv[32] = 8'hf8;
      expv[33] = 8'hf3;
      expv[34] = 8'hfe;
      expv[35] = 8'he8;
      expv[36] = 8'hdd;
      expv[37] = 8'hfe;
      expv[38] = 8'hf4;
      expv[39] = 8'hde;
      expv[40] = 8'hf7;
      expv[41] = 8'hf7;
      expv[42] = 8'hfd;
      expv[43] = 8'hd5;
      expv[44] = 8'hfd;
      expv[45] = 8'hfe;
      expv[46] = 8'hfb;
      expv[47] = 8'hee;
      expv[48] = 8'h95;
      expv[49] = 8'hd1;
      expv[50] = 8'hf9;
      expv[51] = 8'hc8;
      expv[52] = 8'he8;
      expv[53] = 8'hf7;
      expv[54] = 8'hfb;
      expv[55] = 8'hf9;
      expv[56] = 8'hf3;
      expv[57] = 8'hb8;
      expv[58] = 8'hb2;
      expv[59] = 8'hd6;
      expv[60] = 8'he2;
      expv[61] = 8'hef;
      expv[62] = 8'hf6;
      expv[63] = 8'hfa;
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
