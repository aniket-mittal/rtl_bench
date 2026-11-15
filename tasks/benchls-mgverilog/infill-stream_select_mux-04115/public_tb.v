// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 62;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04115 dut (
    .clk(clk),
    .reset(in_vec[61:61]),
    .sync_data(in_vec[60:60]),
    .sync_valid(in_vec[59:59]),
    .stream_in_data_0(in_vec[58:35]),
    .stream_in_startofpacket_0(in_vec[34:34]),
    .stream_in_endofpacket_0(in_vec[33:33]),
    .stream_in_empty_0(in_vec[32:31]),
    .stream_in_valid_0(in_vec[30:30]),
    .stream_in_data_1(in_vec[29:6]),
    .stream_in_startofpacket_1(in_vec[5:5]),
    .stream_in_endofpacket_1(in_vec[4:4]),
    .stream_in_empty_1(in_vec[3:2]),
    .stream_in_valid_1(in_vec[1:1]),
    .stream_out_ready(in_vec[0:0]),
    .sync_ready(out_vec[31:31]),
    .stream_in_ready_0(out_vec[30:30]),
    .stream_in_ready_1(out_vec[29:29]),
    .stream_out_data(out_vec[28:5]),
    .stream_out_startofpacket(out_vec[4:4]),
    .stream_out_endofpacket(out_vec[3:3]),
    .stream_out_empty(out_vec[2:1]),
    .stream_out_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 62'h307e06b978761e78;
    stim[1] = 62'h358256550f468016;
    stim[2] = 62'h2329a51462aa96bc;
    stim[3] = 62'h3773aeee75286aa0;
    stim[4] = 62'h07a06c1fb634e182;
    stim[5] = 62'h06fe802b28b0012b;
    stim[6] = 62'h14d7328bc3c0ad14;
    stim[7] = 62'h005d7a77c8a614bb;
    stim[8] = 62'h00fd8c371c4c4355;
    stim[9] = 62'h1f605b1f19a45129;
    stim[10] = 62'h1cec9d3f009fe569;
    stim[11] = 62'h16563b154f3fdcd3;
    stim[12] = 62'h13aa4e52588f3350;
    stim[13] = 62'h1fe09581631c8be3;
    stim[14] = 62'h0e297328b5cac1e0;
    stim[15] = 62'h1aac9999f27b070f;
    stim[16] = 62'h123258802e828d20;
    stim[17] = 62'h07c770122592ab5c;
    stim[18] = 62'h0084e163516f55bd;
    stim[19] = 62'h036403491ea6a96d;
    stim[20] = 62'h3f7fc7ce62e2a02d;
    stim[21] = 62'h06e90b4256ea6659;
    stim[22] = 62'h1c38e1dcd6199b2a;
    stim[23] = 62'h0c131e8e1aad9ed1;
    stim[24] = 62'h15a8a0529e297c73;
    stim[25] = 62'h1cc244361a48e290;
    stim[26] = 62'h0f29dc4e89520670;
    stim[27] = 62'h16336c1572c259d3;
    stim[28] = 62'h0a66b382ab6a43dd;
    stim[29] = 62'h1c7001616ffe7758;
    stim[30] = 62'h0bc90af09100822c;
    stim[31] = 62'h188cd5f281188969;
    stim[32] = 62'h0a85730283b03972;
    stim[33] = 62'h0d884e6b4fdd9a0d;
    stim[34] = 62'h23aa16eaf10eeae1;
    stim[35] = 62'h0df7eb5822c4b8fa;
    stim[36] = 62'h032e61f54f2bdbf0;
    stim[37] = 62'h004cdbc7f68b6d0d;
    stim[38] = 62'h1b2b92af6c82298f;
    stim[39] = 62'h0c9d80348fa5dbf9;
    stim[40] = 62'h133aba22ec784e4b;
    stim[41] = 62'h1e6b44cc55cf5e61;
    stim[42] = 62'h04230dbd54c61883;
    stim[43] = 62'h0e4bcd3f41bb296d;
    stim[44] = 62'h15d3c2721f74edce;
    stim[45] = 62'h0d88064707e3882e;
    stim[46] = 62'h19c7820b620d610b;
    stim[47] = 62'h1f036ab671f98b7b;
    stim[48] = 62'h00f5c93172c6c884;
    stim[49] = 62'h15dc3172b218e66a;
    stim[50] = 62'h0619472a27a2aecc;
    stim[51] = 62'h068d66c1685bfc02;
    stim[52] = 62'h30e6edb3b7c18f65;
    stim[53] = 62'h185481a1c0b72e8d;
    stim[54] = 62'h3849b3ec0be6931d;
    stim[55] = 62'h1111fb20c056e653;
    stim[56] = 62'h02b4b080e9ea6143;
    stim[57] = 62'h01c3811e60c6b78e;
    stim[58] = 62'h1f1970037d5454e1;
    stim[59] = 62'h04de20e09b454678;
    stim[60] = 62'h0b622089d1d67181;
    stim[61] = 62'h1f48698ddd650f9c;
    stim[62] = 62'h0dffd925514ad53c;
    stim[63] = 62'h162d9c2a05c50c8c;
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
      expv[1] = 32'h80000000;
      expv[2] = 32'hc0000000;
      expv[3] = 32'hc0000000;
      expv[4] = 32'h80000000;
      expv[5] = 32'h80000000;
      expv[6] = 32'hc0000000;
      expv[7] = 32'hd35cca2f;
      expv[8] = 32'h8175e9df;
      expv[9] = 32'h8175e9de;
      expv[10] = 32'h8175e9de;
      expv[11] = 32'ha175e9de;
      expv[12] = 32'h879fee69;
      expv[13] = 32'ha79fee69;
      expv[14] = 32'h118e45f1;
      expv[15] = 32'h318e45f1;
      expv[16] = 32'h193d8387;
      expv[17] = 32'h193d8387;
      expv[18] = 32'h193d8387;
      expv[19] = 32'h193d8386;
      expv[20] = 32'h193d8386;
      expv[21] = 32'hc0000000;
      expv[22] = 32'h9ba42d09;
      expv[23] = 32'h9ba42d09;
      expv[24] = 32'h9ba42d08;
      expv[25] = 32'h9ba42d08;
      expv[26] = 32'h9ba42d08;
      expv[27] = 32'hdba42d08;
      expv[28] = 32'h18cdb055;
      expv[29] = 32'h58cdb054;
      expv[30] = 32'h11c00585;
      expv[31] = 32'h11c00585;
      expv[32] = 32'h11c00584;
      expv[33] = 32'hd1c00584;
      expv[34] = 32'hd62139ad;
      expv[35] = 32'h80000000;
      expv[36] = 32'hc0000000;
      expv[37] = 32'hccb987d5;
      expv[38] = 32'hc1336f1f;
      expv[39] = 32'h8cae4abd;
      expv[40] = 32'hccae4abc;
      expv[41] = 32'hcceae88b;
      expv[42] = 32'h39ad1331;
      expv[43] = 32'h0a630c41;
      expv[44] = 32'h2a630c40;
      expv[45] = 32'h0fba76e7;
      expv[46] = 32'h2fba76e7;
      expv[47] = 32'hb106b085;
      expv[48] = 32'h98fcc5bd;
      expv[49] = 32'h98fcc5bd;
      expv[50] = 32'h98fcc5bd;
      expv[51] = 32'h98fcc5bd;
      expv[52] = 32'h98fcc5bd;
      expv[53] = 32'hc0000000;
      expv[54] = 32'h81520687;
      expv[55] = 32'hc0000000;
      expv[56] = 32'hc447ec83;
      expv[57] = 32'h8ad2c203;
      expv[58] = 32'hcad2c203;
      expv[59] = 32'h9c65c00d;
      expv[60] = 32'h9c65c00d;
      expv[61] = 32'hdc65c00c;
      expv[62] = 32'h1d21a637;
      expv[63] = 32'h1d21a637;
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
