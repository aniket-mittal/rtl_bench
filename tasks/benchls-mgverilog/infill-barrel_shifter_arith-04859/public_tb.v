// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04859 dut (
    .inp(in_vec[37:6]),
    .shamt(in_vec[5:1]),
    .isSrl(in_vec[0:0]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h3f3518b7fd;
    stim[1] = 38'h1873400cad;
    stim[2] = 38'h0e6a39352c;
    stim[3] = 38'h29571d6023;
    stim[4] = 38'h0e507a0bd3;
    stim[5] = 38'h0c12e67335;
    stim[6] = 38'h2d068fa6b9;
    stim[7] = 38'h02a1840bf8;
    stim[8] = 38'h2e8a3e6e0c;
    stim[9] = 38'h34a6d99685;
    stim[10] = 38'h17a3662e50;
    stim[11] = 38'h2d055cc517;
    stim[12] = 38'h33ed0cef7f;
    stim[13] = 38'h31cfb397ff;
    stim[14] = 38'h3feccaef6a;
    stim[15] = 38'h2bd8fb4477;
    stim[16] = 38'h166cb644e6;
    stim[17] = 38'h1bae0a0b36;
    stim[18] = 38'h06586eb130;
    stim[19] = 38'h3edb107d99;
    stim[20] = 38'h3fef822568;
    stim[21] = 38'h19f26607db;
    stim[22] = 38'h2d34cf73a7;
    stim[23] = 38'h36eb606af0;
    stim[24] = 38'h34e027cb67;
    stim[25] = 38'h058e05a498;
    stim[26] = 38'h07586566c8;
    stim[27] = 38'h3b2b417e91;
    stim[28] = 38'h3bf5ae8a4d;
    stim[29] = 38'h20b9f18a81;
    stim[30] = 38'h399f52b6c0;
    stim[31] = 38'h2dcbb111ea;
    stim[32] = 38'h1b278446d6;
    stim[33] = 38'h3426efb671;
    stim[34] = 38'h0def8eaa78;
    stim[35] = 38'h126ef7d773;
    stim[36] = 38'h01b34cac54;
    stim[37] = 38'h37f20104de;
    stim[38] = 38'h12ef74515c;
    stim[39] = 38'h2132687bc4;
    stim[40] = 38'h2943e69e96;
    stim[41] = 38'h2f1dbf656d;
    stim[42] = 38'h0631d62568;
    stim[43] = 38'h3cedfb71a9;
    stim[44] = 38'h29797bf087;
    stim[45] = 38'h29b49f9af2;
    stim[46] = 38'h35a1b95f70;
    stim[47] = 38'h0ed8181001;
    stim[48] = 38'h2cca6de461;
    stim[49] = 38'h25fcb1c2bd;
    stim[50] = 38'h1750487301;
    stim[51] = 38'h0817398780;
    stim[52] = 38'h058faeb2ed;
    stim[53] = 38'h05bf6c752a;
    stim[54] = 38'h3a2686c9aa;
    stim[55] = 38'h2c325bd4a3;
    stim[56] = 38'h35ec75575f;
    stim[57] = 38'h146efae4c1;
    stim[58] = 38'h30beb7dacd;
    stim[59] = 38'h1b71f9ffc7;
    stim[60] = 38'h263e07a1bb;
    stim[61] = 38'h08b6e34212;
    stim[62] = 38'h3aa8333ca0;
    stim[63] = 38'h37253c60d6;
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
      expv[0] = 32'h00000003;
      expv[1] = 32'h00000187;
      expv[2] = 32'h000000e6;
      expv[3] = 32'h000052ae;
      expv[4] = 32'h001ca0f4;
      expv[5] = 32'h0000000c;
      expv[6] = 32'h0000000b;
      expv[7] = 32'h00000000;
      expv[8] = 32'hfee8a3e6;
      expv[9] = 32'h34a6d996;
      expv[10] = 32'h005e8d98;
      expv[11] = 32'h001682ae;
      expv[12] = 32'h00000001;
      expv[13] = 32'h00000001;
      expv[14] = 32'hfffffffd;
      expv[15] = 32'h00000015;
      expv[16] = 32'h00000b36;
      expv[17] = 32'h0000000d;
      expv[18] = 32'h00000019;
      expv[19] = 32'h000fb6c4;
      expv[20] = 32'hfffffffb;
      expv[21] = 32'h00033e4c;
      expv[22] = 32'h0000169a;
      expv[23] = 32'hffffffdb;
      expv[24] = 32'h00001a70;
      expv[25] = 32'h00016381;
      expv[26] = 32'h01d61959;
      expv[27] = 32'h00ecad05;
      expv[28] = 32'h03bf5ae8;
      expv[29] = 32'h82e7c62a;
      expv[30] = 32'he67d4adb;
      expv[31] = 32'hfffffdb9;
      expv[32] = 32'h000d93c2;
      expv[33] = 32'h000000d0;
      expv[34] = 32'h00000003;
      expv[35] = 32'h00000024;
      expv[36] = 32'h0001b34c;
      expv[37] = 32'hffffbf90;
      expv[38] = 32'h00012ef7;
      expv[39] = 32'he132687b;
      expv[40] = 32'hfff4a1f3;
      expv[41] = 32'h000002f1;
      expv[42] = 32'h0000018c;
      expv[43] = 32'h00000f3b;
      expv[44] = 32'h14bcbdf8;
      expv[45] = 32'hffffffd3;
      expv[46] = 32'hffffffd6;
      expv[47] = 32'h3b606040;
      expv[48] = 32'h0000b329;
      expv[49] = 32'h00000002;
      expv[50] = 32'h5d4121cc;
      expv[51] = 32'h205ce61e;
      expv[52] = 32'h00000058;
      expv[53] = 32'h000000b7;
      expv[54] = 32'hffffff44;
      expv[55] = 32'h00005864;
      expv[56] = 32'h0001af63;
      expv[57] = 32'h51bbeb93;
      expv[58] = 32'h030beb7d;
      expv[59] = 32'h0db8fcff;
      expv[60] = 32'h00000004;
      expv[61] = 32'h00116dc6;
      expv[62] = 32'hffffeaa0;
      expv[63] = 32'hfffb929e;
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
