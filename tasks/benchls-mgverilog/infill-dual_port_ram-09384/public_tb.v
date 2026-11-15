// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 55;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09384 dut (
    .clk(clk),
    .addr0(in_vec[54:45]),
    .ce0(in_vec[44:44]),
    .d0(in_vec[43:12]),
    .we0(in_vec[11:11]),
    .addr1(in_vec[10:1]),
    .ce1(in_vec[0:0]),
    .q0(out_vec[63:32]),
    .q1(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 55'h2840f80e0d56e3;
    stim[1] = 55'h2d084d3b08b8be;
    stim[2] = 55'h00ea1b50da8997;
    stim[3] = 55'h2c8aaaa414bdfd;
    stim[4] = 55'h48462410567a55;
    stim[5] = 55'h263f8ff8088718;
    stim[6] = 55'h5d4cb810eb3817;
    stim[7] = 55'h0796fa6417e855;
    stim[8] = 55'h78a24906406b22;
    stim[9] = 55'h5f5768dd094f53;
    stim[10] = 55'h6bdf742138afeb;
    stim[11] = 55'h1df9a266f6ec3e;
    stim[12] = 55'h6adc6b19ad5ced;
    stim[13] = 55'h78dccde9994279;
    stim[14] = 55'h5db9b23302dfb3;
    stim[15] = 55'h0442dda12a6413;
    stim[16] = 55'h74da4d26b811ef;
    stim[17] = 55'h33a72068fafcfc;
    stim[18] = 55'h358c0b4d1be211;
    stim[19] = 55'h793762ebb2362b;
    stim[20] = 55'h16eef29c839516;
    stim[21] = 55'h240866b17420fc;
    stim[22] = 55'h4c89301bc53a63;
    stim[23] = 55'h117377c60789f6;
    stim[24] = 55'h5bd7ccf86a9a05;
    stim[25] = 55'h6545ac4f78b8fa;
    stim[26] = 55'h48e1c22d493177;
    stim[27] = 55'h489b6888d60d40;
    stim[28] = 55'h616487cedb568b;
    stim[29] = 55'h74a2fef16e9de3;
    stim[30] = 55'h49ba473c5f42f2;
    stim[31] = 55'h661e1dc9900e43;
    stim[32] = 55'h779b794a90b1a8;
    stim[33] = 55'h7f4a8d06106eb2;
    stim[34] = 55'h5c46bc92ba70d9;
    stim[35] = 55'h709691c881c944;
    stim[36] = 55'h6706e796e68168;
    stim[37] = 55'h0ee1eb77aae58e;
    stim[38] = 55'h71a24e233b6faa;
    stim[39] = 55'h2eebbf63b25e0e;
    stim[40] = 55'h65cd92819ceff1;
    stim[41] = 55'h132a287e0d1e7e;
    stim[42] = 55'h45a3c6f6fdfcd3;
    stim[43] = 55'h6adf4ecbf27cdd;
    stim[44] = 55'h5886b222a2a0ed;
    stim[45] = 55'h419d559e9bf8a9;
    stim[46] = 55'h019ac0027e826b;
    stim[47] = 55'h0cfcba4b97eb67;
    stim[48] = 55'h668288535781a1;
    stim[49] = 55'h1d55abc00010f4;
    stim[50] = 55'h18b4a99c3147e0;
    stim[51] = 55'h5f2505d3fb6587;
    stim[52] = 55'h7b07f5030482e4;
    stim[53] = 55'h3d9e89a39ac907;
    stim[54] = 55'h4821417f564db0;
    stim[55] = 55'h5873900004f786;
    stim[56] = 55'h7e4bbd4798e875;
    stim[57] = 55'h1263d107c966f0;
    stim[58] = 55'h5c6a2ac605f5c1;
    stim[59] = 55'h4513917da4f790;
    stim[60] = 55'h254ff7839e347b;
    stim[61] = 55'h496bf2efac3558;
    stim[62] = 55'h765224273b6cf4;
    stim[63] = 55'h285ccadc20cbe6;
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
      expv[0] = 64'hxxxxxxxxxxxxxxxx;
      expv[1] = 64'hxxxxxxxxxxxxxxxx;
      expv[2] = 64'hxxxxxxxxxxxxxxxx;
      expv[3] = 64'hxxxxxxxxxxxxxxxx;
      expv[4] = 64'hxxxxxxxxxxxxxxxx;
      expv[5] = 64'hxxxxxxxxxxxxxxxx;
      expv[6] = 64'hxxxxxxxxxxxxxxxx;
      expv[7] = 64'hxxxxxxxxxxxxxxxx;
      expv[8] = 64'h6fa6417exxxxxxxx;
      expv[9] = 64'h6fa6417exxxxxxxx;
      expv[10] = 64'h768dd094xxxxxxxx;
      expv[11] = 64'hf742138axxxxxxxx;
      expv[12] = 64'h9a266f6exxxxxxxx;
      expv[13] = 64'hc6b19ad5xxxxxxxx;
      expv[14] = 64'hxxxxxxxxxxxxxxxx;
      expv[15] = 64'h9b23302dxxxxxxxx;
      expv[16] = 64'h9b23302dxxxxxxxx;
      expv[17] = 64'hxxxxxxxxxxxxxxxx;
      expv[18] = 64'hxxxxxxxxxxxxxxxx;
      expv[19] = 64'hxxxxxxxxxxxxxxxx;
      expv[20] = 64'hxxxxxxxxxxxxxxxx;
      expv[21] = 64'hxxxxxxxxxxxxxxxx;
      expv[22] = 64'hxxxxxxxxxxxxxxxx;
      expv[23] = 64'hxxxxxxxxxxxxxxxx;
      expv[24] = 64'h377c6078xxxxxxxx;
      expv[25] = 64'h7ccf86a9xxxxxxxx;
      expv[26] = 64'h7ccf86a9xxxxxxxx;
      expv[27] = 64'h7ccf86a9xxxxxxxx;
      expv[28] = 64'hb6888d60xxxxxxxx;
      expv[29] = 64'hb6888d60xxxxxxxx;
      expv[30] = 64'hb6888d60xxxxxxxx;
      expv[31] = 64'hxxxxxxxxxxxxxxxx;
      expv[32] = 64'he1dc9900xxxxxxxx;
      expv[33] = 64'hxxxxxxxxxxxxxxxx;
      expv[34] = 64'hxxxxxxxxxxxxxxxx;
      expv[35] = 64'hxxxxxxxxxxxxxxxx;
      expv[36] = 64'h691c881cxxxxxxxx;
      expv[37] = 64'h691c881cxxxxxxxx;
      expv[38] = 64'h691c881cxxxxxxxx;
      expv[39] = 64'h691c881cxxxxxxxx;
      expv[40] = 64'h691c881cxxxxxxxx;
      expv[41] = 64'h691c881cxxxxxxxx;
      expv[42] = 64'h691c881cxxxxxxxx;
      expv[43] = 64'h691c881cxxxxxxxx;
      expv[44] = 64'hf4ecbf27xxxxxxxx;
      expv[45] = 64'hf4ecbf27xxxxxxxx;
      expv[46] = 64'hd559e9bfxxxxxxxx;
      expv[47] = 64'hxxxxxxxxxxxxxxxx;
      expv[48] = 64'hcba4b97exxxxxxxx;
      expv[49] = 64'hcba4b97exxxxxxxx;
      expv[50] = 64'hxxxxxxxxxxxxxxxx;
      expv[51] = 64'hxxxxxxxxxxxxxxxx;
      expv[52] = 64'hxxxxxxxxxxxxxxxx;
      expv[53] = 64'hxxxxxxxxxxxxxxxx;
      expv[54] = 64'he89a39acxxxxxxxx;
      expv[55] = 64'he89a39acxxxxxxxx;
      expv[56] = 64'hxxxxxxxxxxxxxxxx;
      expv[57] = 64'hxxxxxxxxxxxxxxxx;
      expv[58] = 64'hxxxxxxxxxxxxxxxx;
      expv[59] = 64'hxxxxxxxxxxxxxxxx;
      expv[60] = 64'hxxxxxxxxxxxxxxxx;
      expv[61] = 64'hxxxxxxxxxxxxxxxx;
      expv[62] = 64'hxxxxxxxxxxxxxxxx;
      expv[63] = 64'h224273b6xxxxxxxx;
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
