// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_151636 dut (
    .a(in_vec[67:36]),
    .b(in_vec[35:4]),
    .aluc(in_vec[3:0]),
    .r(out_vec[35:4]),
    .zero(out_vec[3:3]),
    .carry(out_vec[2:2]),
    .negative(out_vec[1:1]),
    .overflow(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'h10c62bb36888b8fa1;
    stim[1] = 68'ha8c8f69b3f2ebf8b5;
    stim[2] = 68'h5e83cadb001d8e55f;
    stim[3] = 68'hb650ff9b9b560d991;
    stim[4] = 68'hf7d90aa144c1b1110;
    stim[5] = 68'hf21b02ecaf2e4c837;
    stim[6] = 68'h8735b642f48833d06;
    stim[7] = 68'h1c711f2d1d7403506;
    stim[8] = 68'he38489246ca526de2;
    stim[9] = 68'h20796c1b089730128;
    stim[10] = 68'hb20537a8641e4c002;
    stim[11] = 68'h051e0ad9af0d744b1;
    stim[12] = 68'hcaa80e07560b6ec6d;
    stim[13] = 68'hcbda56b6c4bd1fb0c;
    stim[14] = 68'h6486d92bf176ce26b;
    stim[15] = 68'he90f3809c28295241;
    stim[16] = 68'hb863afd9906e6760c;
    stim[17] = 68'hefbd93af31ebdb496;
    stim[18] = 68'h36483f280191a560a;
    stim[19] = 68'h9080693c3bf2827a4;
    stim[20] = 68'hac3b25744edd8309a;
    stim[21] = 68'h3142c4c51be503d01;
    stim[22] = 68'h102aac93c2c836d07;
    stim[23] = 68'h9182bb62e6aadaf80;
    stim[24] = 68'hfcf6f7e15d59f090a;
    stim[25] = 68'h360942fe817af7d8f;
    stim[26] = 68'h0c9cec49486235b87;
    stim[27] = 68'h1f532eb4e3dfc0b85;
    stim[28] = 68'he10a88c5f000f1d6a;
    stim[29] = 68'h4c69783d00619c4e5;
    stim[30] = 68'h352f68a1253a68025;
    stim[31] = 68'he10d706b40c079db2;
    stim[32] = 68'h5b47ae4ed196e1d4e;
    stim[33] = 68'he8c1fed330e6ad7b7;
    stim[34] = 68'h98545873411f3926f;
    stim[35] = 68'h92af3abd6e3d9527e;
    stim[36] = 68'h2dd4766c9db1abc2d;
    stim[37] = 68'ha807716cd6be682e8;
    stim[38] = 68'h8a1e5d19dbdc33cc7;
    stim[39] = 68'h2bf0076b918064ec3;
    stim[40] = 68'h512d85eb79eab059b;
    stim[41] = 68'h0f96f780e64375371;
    stim[42] = 68'h02fe4ba06b0b45d94;
    stim[43] = 68'h2a5d8189f1fc406f5;
    stim[44] = 68'hd291e7db93d9dfaec;
    stim[45] = 68'hb6c1349207a252f7a;
    stim[46] = 68'he112b161a2371c9af;
    stim[47] = 68'h0b357bb7cafb6d5d3;
    stim[48] = 68'hfeac4e06a423db018;
    stim[49] = 68'hf6e048a4c7865b6fe;
    stim[50] = 68'ha38e6ca32b6ec8194;
    stim[51] = 68'h5fabe941b6e51d938;
    stim[52] = 68'he39a3389e29fe46bc;
    stim[53] = 68'hef118517d01927bc8;
    stim[54] = 68'h0e9298d391012b113;
    stim[55] = 68'h599ff24fbf26982db;
    stim[56] = 68'h5ab269ef702ee833a;
    stim[57] = 68'hee88c8f11914ad682;
    stim[58] = 68'h6457b71c9001494e5;
    stim[59] = 68'hab988d8c7b364d6f6;
    stim[60] = 68'h9523e2e87de71b7ac;
    stim[61] = 68'hc0f49d2094f8af1e3;
    stim[62] = 68'h9451600139f796cb7;
    stim[63] = 68'ha570d588f653cce08;
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
      expv[0] = 36'ha83d72b92;
      expv[1] = 36'hbfeeff9b2;
      expv[2] = 36'h000000000;
      expv[3] = 36'h1afaf2024;
      expv[4] = 36'h3c9abbb24;
      expv[5] = 36'h00c0b1104;
      expv[6] = 36'h73bd85924;
      expv[7] = 36'h01051c7d4;
      expv[8] = 36'h5029b0024;
      expv[9] = 36'h301200004;
      expv[10] = 36'h162383a84;
      expv[11] = 36'h5610968e4;
      expv[12] = 36'h00ac16dd4;
      expv[13] = 36'h0312f47e4;
      expv[14] = 36'h73100b054;
      expv[15] = 36'h268ca2e54;
      expv[16] = 36'h004837334;
      expv[17] = 36'hde5648e66;
      expv[18] = 36'h34b699c80;
      expv[19] = 36'h108000380;
      expv[20] = 36'h5d5da26b4;
      expv[21] = 36'h155dc0f50;
      expv[22] = 36'h2d15412c0;
      expv[23] = 36'h782d965a1;
      expv[24] = 36'h9f9d07513;
      expv[25] = 36'h000000000;
      expv[26] = 36'hb30102062;
      expv[27] = 36'hffdfeebc2;
      expv[28] = 36'hf10996ef2;
      expv[29] = 36'h4c69fc7f0;
      expv[30] = 36'h353f68a30;
      expv[31] = 36'h21cdea464;
      expv[32] = 36'hb87500006;
      expv[33] = 36'h071800044;
      expv[34] = 36'h000000000;
      expv[35] = 36'hb2a4e0006;
      expv[36] = 36'h0009db1a4;
      expv[37] = 36'h682e00004;
      expv[38] = 36'h242180224;
      expv[39] = 36'h9a6fa27f7;
      expv[40] = 36'hd742d5927;
      expv[41] = 36'h295382494;
      expv[42] = 36'h020a41804;
      expv[43] = 36'hfbfdc1ef6;
      expv[44] = 36'h00127b3b4;
      expv[45] = 36'haf1ee19b2;
      expv[46] = 36'h000000000;
      expv[47] = 36'h403a0e5a4;
      expv[48] = 36'hdb0100006;
      expv[49] = 36'h7865b6f00;
      expv[50] = 36'h230e48010;
      expv[51] = 36'h1d9300000;
      expv[52] = 36'h3fc8d6000;
      expv[53] = 36'h27bc00000;
      expv[54] = 36'h7d916dc24;
      expv[55] = 36'h9a795a226;
      expv[56] = 36'hea8381bc2;
      expv[57] = 36'h079d76594;
      expv[58] = 36'hf457ff5e6;
      expv[59] = 36'hd0aec0e36;
      expv[60] = 36'he71b7a006;
      expv[61] = 36'h2bfbee024;
      expv[62] = 36'h420809344;
      expv[63] = 36'hcce000006;
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
